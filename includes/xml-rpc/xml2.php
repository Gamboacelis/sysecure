<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php

require_once('phpxmlrpc-2.2.2/lib/xmlrpc.inc');
require_once('phpxmlrpc-2.2.2/lib/xmlrpcs.inc');
$GLOBALS['xmlrpc_internalencoding']='UTF-8';

$dbname = 'esigpen_test09';
$user = 'admin';
$password = 'admin@esigpen';

$server_url = 'http://23.253.160.210:8069'; 
$connexion = new xmlrpc_client($server_url . "/xmlrpc/common");
$connexion->setSSLVerifyPeer(0);

$c_msg = new xmlrpcmsg('login');
$c_msg->addParam(new xmlrpcval($dbname, "string"));
$c_msg->addParam(new xmlrpcval($user, "string"));
$c_msg->addParam(new xmlrpcval($password, "string"));
$c_response = $connexion->send($c_msg);

if ($c_response->errno != 0){
    echo  '<p>error : ' . $c_response->faultString() . '</p>';
}
else{
    
    $uid = $c_response->value()->scalarval();

  $val =  array("name", "ilike", "FREDDY");   

   /* $val = array ( 
        new xmlrpcval(
            array(new xmlrpcval('name' , "string"), 
                  new xmlrpcval('=',"string"), 
                  new xmlrpcval('FREDDY',"string")
                  ),"array"             
            ),
        );*/
  
    
    $client = new xmlrpc_client($server_url . "/xmlrpc/object");
    $client->setSSLVerifyPeer(0);

    $msg = new xmlrpcmsg('execute'); 
    $msg->addParam(new xmlrpcval($dbname, "string")); 
    $msg->addParam(new xmlrpcval($uid, "int")); 
    $msg->addParam(new xmlrpcval($password, "string")); 
    $msg->addParam(new xmlrpcval("prison.person", "string")); 
  	$msg->addParam(new xmlrpcval("search", "string"));     
    $msg->addParam(new xmlrpcval($val, "object")); 

    

    $response = $client->send($msg);    
          if ($response->errno != 0){
    echo  '<p>error : ' . $response->faultString() . '</p>';
	  }
    $result1 = $response->value();
    $ids = $result1->scalarval();
    $id_list = array();


    
    for($i = 0; $i < count($ids); $i++){
        $id_list[]= new xmlrpcval($ids[$i]->me['int'], 'int');
    }


    $field_list = array(
        new xmlrpcval("id", "string"),
        new xmlrpcval("name", "string"),
        new xmlrpcval("last_name", "string"),

    );

    // $parametros = array( "prontuario", "name", "last_name"  );   
    $msg1 = new xmlrpcmsg('execute'); 
    $msg1->addParam(new xmlrpcval($dbname, "string")); 
    $msg1->addParam(new xmlrpcval($uid, "int")); 
    $msg1->addParam(new xmlrpcval($password, "string")); 
    $msg1->addParam(new xmlrpcval("prison.person", "string")); 
    $msg1->addParam(new xmlrpcval("read", "string"));     
    $msg1->addParam(new xmlrpcval($id_list, "array"));     
    $msg1->addParam(new xmlrpcval($field_list, "array"));     

    $response1 = $client->send($msg1);    

    $result = $response1->value();   
    $ids1 = $result->scalarval(); 

    echo "<table>";
    for($i = 0; $i < count($ids1); $i++){
        echo '<tr><td>' . $ids1[$i]->me['struct']['id']->me['string'] . '</td>'
           . '<td>' . $ids1[$i]->me['struct']['name']->me['string'] . '</td>'
           . '<td>' . $ids1[$i]->me['struct']['last_name']->me['string'] . '</td>'   
           . '</tr>';
    }

    echo "</table>";
   
  
}
?>
