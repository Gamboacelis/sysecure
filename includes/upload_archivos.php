<?php

session_start();
include_once 'conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['funcion']) ? $_GET['funcion'] : 'ninguno';
switch ($funcion) {
    case 'subirImagenPpl':
        subirImagenPpl();
        break;
    case 'subirImagenVisitante':
        subirImagenVisitante();
        break;
}

function subirImagenPpl() {
    if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
        $nombre_original = basename($_FILES['filePpl']['name']);
        $crea_nombre = colocaNombre($nombre_original);
        $uploaddir = '..'.PATH_PPL;
        $uploadfile = $uploaddir . $crea_nombre;
        if (move_uploaded_file($_FILES['filePpl']['tmp_name'], $uploadfile)) {
            echo $crea_nombre; //devolvemos el nombre del archivo para pintar la imagen
        }
    } else {
        throw new Exception("Error Processing Request", 1);
    }
}
function subirImagenVisitante() {
    if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
        $nombre_original = basename($_FILES['fileVisitas']['name']);
        $crea_nombre = colocaNombre($nombre_original);
        $uploaddir = '..'.PATH_VISITAS;
        $uploadfile = $uploaddir . $crea_nombre;
        if (move_uploaded_file($_FILES['fileVisitas']['tmp_name'], $uploadfile)) {
            echo $uploadfile; //devolvemos el nombre del archivo para pintar la imagen
        }
    } else {
        throw new Exception("Error Processing Request", 1);
    }
}
function limpiarCadena($cadena) {
    $minusculas = strtolower($cadena);
    $limpiar = str_replace(' ', '-', $minusculas);
    $limpiar2 = trim($limpiar, "\t\n\r\0\x0B");
    $limpiar3 = preg_replace('/[^\w\d]/', '', $limpiar2);
    return $limpiar3;
}

function colocaNombre($nombre_original) {
    if ($nombre_original != '') {
        $ext = substr($nombre_original,-3);
        $cnom= strripos($nombre_original, '.');
        $nombre = substr($nombre_original,0,$cnom);
        $minusculas = strtolower($nombre);
        $limpiar = str_replace('.','-', $minusculas);
        $limpiar1 = str_replace(' ', '-', $limpiar);
        $limpiar2 = trim($limpiar1, "\t\n\r\0\x0B");
        $limpiar3 = preg_replace('/[^\w\d]/', '', $limpiar2);
//        $correc_final=strtoupper ($limpiar3);
    }
    $nombre_fin = $limpiar3 . '.' . $ext;
    return $nombre_fin;
}

function guardarImgProductoUp($producto, $nombre, $titulo, $ext, $descrip, $path, $peso) {
    global $dbmysql;
    $tamano = $peso;
    $sql = "";
    $consulta = "SELECT * FROM `con_producto`  WHERE PRO_ID=$producto";
    $consvals = $dbmysql->query($consulta);
    $consval = $consvals->fetch_object();
    // CONSULTAR ARCHIVO EXISTENTE
    if ($nombre != 'Imagen Producto D') {
        $consulta_img = "SELECT * FROM `con_adjuntos`  WHERE PRO_ID=$producto AND ADJ_NOMBRE='$nombre'";
        $consvals_img = $dbmysql->query($consulta_img);
        $val = $consvals_img->num_rows;
    } else {
        $val = 0;
    }
    if ($val == 0) {

        $sql = "INSERT INTO `con_adjuntos` (
                    `ADJ_ID` ,
                    `PRO_ID` ,
                    `ADJ_TITULO` ,
                    `ADJ_NOMBRE` ,
                    `ADJ_EXTENSION` ,
                    `ADJ_DESCRIPCION` ,
                    `ADJ_PUBLICAR` ,
                    `ADJ_PATH` ,
                    `ADJ_PESO`,
                    `ADJ_ESTADO`
                    )
                    VALUES (NULL , '$producto', '$titulo','$nombre' ,'$ext', '$descrip', 'SI', '$path', '$tamano','A');";
        $val = $dbmysql->query($sql);
        auditoria('Productos', $producto, 'Inserta Adjuntos Producto: ' . $consval->PRO_CODIGO_GENERAL . ', Adjunto: ' . $titulo . ', Tipo: ' . $ext, 'I');
    } else {
        $sql = "UPDATE `con_adjuntos` SET
                    `ADJ_TITULO` = '$titulo',
                    `ADJ_EXTENSION` ='$ext',
                    `ADJ_DESCRIPCION` ='$descrip',
                    `ADJ_PUBLICAR` ='SI',
                    `ADJ_PATH` ='$path',
                    `ADJ_PESO` ='$tamano',
                    `ADJ_ESTADO`='A'
                    WHERE PRO_ID=$producto AND ADJ_NOMBRE='$nombre';";
        $val = $dbmysql->query($sql);
        auditoria('Productos', $producto, 'Actualiza Adjunto: ' . $nombre . ' del producto: ' . $consval->PRO_CODIGO_GENERAL . ', Adjunto: ' . $titulo . ', Tipo: ' . $ext, 'A');
    }
}

function sizeUp($path, $formated = true, $retstring = null) {
    if (!is_dir($path) || !is_readable($path)) {
        if (is_file($path) || file_exists($path)) {
            $size = filesize($path);
        } else {
            return false;
        }
    } else {
        $path_stack[] = $path;
        $size = 0;

        do {
            $path = array_shift($path_stack);
            $handle = opendir($path);
            while (false !== ($file = readdir($handle))) {
                if ($file != '.' && $file != '..' && is_readable($path . DIRECTORY_SEPARATOR . $file)) {
                    if (is_dir($path . DIRECTORY_SEPARATOR . $file)) {
                        $path_stack[] = $path . DIRECTORY_SEPARATOR . $file;
                    }
                    $size += filesize($path . DIRECTORY_SEPARATOR . $file);
                }
            }
            closedir($handle);
        } while (count($path_stack) > 0);
    }
    if ($formated) {
        $sizes = array('B', 'kB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
        if ($retstring == null) {
            $retstring = '%01.2f %s';
        }
        $lastsizestring = end($sizes);
        foreach ($sizes as $sizestring) {
            if ($size < 1024) {
                break;
            }
            if ($sizestring != $lastsizestring) {
                $size /= 1024;
            }
        }
        if ($sizestring == $sizes[0]) {
            $retstring = '%01d %s';
        } // los Bytes normalmente no son fraccionales
        $size = sprintf($retstring, $size, $sizestring);
    }
    return $size;
}

function crearThumbnail($nombreImagen, $nombreThumbnail, $nuevoAncho, $nuevoAlto) {

    // Obtiene las dimensiones de la imagen.
    list($ancho, $alto) = getimagesize($nombreImagen);

    // Establece el alto para el thumbnail si solo se paso el ancho.
    if ($nuevoAlto == 0 && $nuevoAncho != 0) {
        $factorReduccion = $ancho / $nuevoAncho;
        $nuevoAlto = $alto / $factorReduccion;
    }

    // Establece el ancho para el thumbnail si solo se paso el alto.
    if ($nuevoAlto != 0 && $nuevoAncho == 0) {
        $factorReduccion = $alto / $nuevoAlto;
        $nuevoAncho = $ancho / $factorReduccion;
    }

    // Abre la imagen original.
    list($imagen, $tipo) = abrirImagen($nombreImagen);

    // Crea la nueva imagen (el thumbnail).
    $thumbnail = imagecreatetruecolor($nuevoAncho, $nuevoAlto);
    imagecopyresampled($thumbnail, $imagen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

    // Guarda la imagen.
    guardarImagen($thumbnail, $nombreThumbnail, $tipo);
}

function abrirImagen($nombre) {
    $info = getimagesize($nombre);
    switch ($info["mime"]) {
        case "image/jpeg":
            $imagen = imagecreatefromjpeg($nombre);
            break;
        case "image/gif":
            $imagen = imagecreatefromgif($nombre);
            break;
        case "image/png":
            $imagen = imagecreatefrompng($nombre);
            break;
        default :
            echo "Error: No es un tipo de imagen permitido.";
    }
    $resultado[0] = $imagen;
    $resultado[1] = $info["mime"];
    return $resultado;
}

function guardarImagen($imagen, $nombre, $tipo) {
    switch ($tipo) {
        case "image/jpeg":
            imagejpeg($imagen, $nombre, 100); // El 100 es la calidade de la imagen (entre 1 y 100. Con 100 sin compresion ni perdida de calidad.).
            break;
        case "image/gif":
            imagegif($imagen, $nombre);
            break;
        case "image/png":
            imagepng($imagen, $nombre, 9); // El 9 es grado de compresion de la imagen (entre 0 y 9. Con 9 maxima compresion pero igual calidad.).
            break;
        default :
            echo "Error: Tipo de imagen no permitido.";
    }
}

?>