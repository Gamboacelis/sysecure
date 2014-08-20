/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     19/08/2014 22:01:35                          */
/*==============================================================*/


drop table if exists sys_accesos;

drop table if exists sys_celdas;

drop table if exists sys_centro;

drop table if exists sys_ciudad;

drop table if exists sys_control;

drop table if exists sys_etapas;

drop table if exists sys_garita;

drop table if exists sys_historia_ppl;

drop table if exists sys_horarios;

drop table if exists sys_item_tipos;

drop table if exists sys_pabellones;

drop table if exists sys_parentesco;

drop table if exists sys_ppl;

drop table if exists sys_ppl_pabellon;

drop table if exists sys_roles;

drop table if exists sys_sanciones;

drop table if exists sys_tipo_sancion;

drop table if exists sys_usuario_centro;

drop table if exists sys_usuarios;

drop table if exists sys_visitante;

drop table if exists sys_visitante_ppl;

drop table if exists sys_visitante_sancion;

drop table if exists sys_visitas;

/*==============================================================*/
/* Table: sys_accesos                                           */
/*==============================================================*/
create table sys_accesos
(
   ACC_COD              int not null comment 'Codigo del Acceso',
   USU_COD              int,
   CEN_COD              int comment 'Codigo del Centro',
   ACC_FECHA            datetime not null comment 'Fecha y Hora de Acceso',
   ACC_IP               varchar(60) not null comment 'Direccion IP del equipo que Accede',
   ACC_EQUIPO           varchar(60) not null comment 'Nombre de la Maquina que Accede',
   primary key (ACC_COD)
);

alter table sys_accesos comment 'Tabla de control de Accesos al Sistema';

/*==============================================================*/
/* Table: sys_celdas                                            */
/*==============================================================*/
create table sys_celdas
(
   CEL_COD              int not null comment 'Codigo de la celda',
   PAB_COD              int comment 'Codigo del pabellon',
   CEL_DESCRPCION       varchar(200) comment 'Descripcion de la celda',
   primary key (CEL_COD)
);

alter table sys_celdas comment 'Celdas que tiene un Pabellon de un centro';

/*==============================================================*/
/* Table: sys_centro                                            */
/*==============================================================*/
create table sys_centro
(
   CEN_COD              int(11) not null auto_increment comment 'Codigo del Centro',
   CIU_COD              int not null comment 'Codigo de la Ciudad',
   CEN_DESCRIPCION      varchar(200) not null comment 'Descripcion del Centro',
   CEN_DIRECCION        varchar(500) not null comment 'Direccion del Centro',
   CEN_TELEFONO         varchar(13) not null comment 'Telefono del Centro',
   primary key (CEN_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;

alter table sys_centro comment 'Datos del los centros a nivel Nacional';

/*==============================================================*/
/* Table: sys_ciudad                                            */
/*==============================================================*/
create table sys_ciudad
(
   CIU_COD              int(11) not null auto_increment comment 'Codigo de Ciudad',
   CIU_DESCRIPCION      varchar(200) not null comment 'Descripcion de la Ciudad',
   primary key (CIU_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

alter table sys_ciudad comment 'Datos de las Ciudades del Ecuador';

/*==============================================================*/
/* Table: sys_control                                           */
/*==============================================================*/
create table sys_control
(
   CON_COD              int(11) not null auto_increment comment 'codigo del Control',
   GAR_COD              int not null comment 'Codigo de la garita',
   VIS_COD              int not null comment 'Codigo secuencial del Visitante',
   CON_ESTADO           varchar(1) not null comment 'A: Activo, I:inactivo',
   primary key (CON_COD)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

/*==============================================================*/
/* Table: sys_etapas                                            */
/*==============================================================*/
create table sys_etapas
(
   NVL_COD              int not null comment 'Codigo de Etapas del Pabellon',
   NVL_DESCRIPCION      varchar(200) comment 'Descripcion de las Etapas del Pabellon',
   primary key (NVL_COD)
);

alter table sys_etapas comment 'Etapas en las que se encuentra un pabellon';

/*==============================================================*/
/* Table: sys_garita                                            */
/*==============================================================*/
create table sys_garita
(
   GAR_COD              int(11) not null auto_increment comment 'Codigo de la garita',
   GAR_DESCRIPCION      int not null comment 'Descripcion de la garita',
   USU_COD              int not null comment 'Codigo de Usuario',
   GAR_ESTADO           varchar(1) not null comment 'Estado de la Garita',
   primary key (GAR_COD)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

/*==============================================================*/
/* Table: sys_historia_ppl                                      */
/*==============================================================*/
create table sys_historia_ppl
(
   HIS_COD              int not null comment 'Codigo del Historial de cambios del PPL',
   USU_COD              int comment 'Codigo de Usuario',
   PPL_COD              int comment 'Codigo del PPL',
   PAB_COD              int comment 'Codigo del pabellon',
   CEL_COD              int comment 'Codigo de la celda',
   HIS_FECHA            datetime not null comment 'fecha de Cambios del Historia',
   HIS_MOTIVO           varchar(500) not null comment 'MOtivo de los cambios',
   primary key (HIS_COD)
);

alter table sys_historia_ppl comment 'Tabla del Historial del PPL';

/*==============================================================*/
/* Table: sys_horarios                                          */
/*==============================================================*/
create table sys_horarios
(
   HOR_COD              int not null comment 'Codigo del Horario',
   PAB_COD              int comment 'Codigo del pabellon',
   HOR_DESCRIPCION      varchar(200) comment 'Descripcion del Horario',
   HOR_DIAS             varchar(200) comment 'Dias disponibles para las visitas',
   HOR_HORA_ING         time comment 'Hora de Ingreso del Horario',
   HOR_HORA_SAL         time comment 'Hora de Salida del Horario',
   HOR_ESTADO           varchar(2) comment 'Estadp del Horario',
   primary key (HOR_COD)
);

alter table sys_horarios comment 'Datos de horarios que pueden tener los pabellones para las v';

/*==============================================================*/
/* Table: sys_item_tipos                                        */
/*==============================================================*/
create table sys_item_tipos
(
   ITS_COD              int not null comment 'Codigo del Item-Tipo-Sancion',
   TPS_COD              int comment 'Codigo del tipo-Sancion',
   ITS_DESCRIPCION      varchar(200) comment 'Descripcion del Item-Tipo-Sancion',
   primary key (ITS_COD)
);

alter table sys_item_tipos comment 'Todos los items que pueden tener los tipos de sancion';

/*==============================================================*/
/* Table: sys_pabellones                                        */
/*==============================================================*/
create table sys_pabellones
(
   PAB_COD              int(11) not null auto_increment comment 'Codigo del pabellon',
   CEN_COD              int not null comment 'Codigo del Centro',
   NVL_COD              int comment 'Codigo de Etapas del Pabellon',
   PAB_ALA              varchar(60) comment 'Ala o Piso del Pabellon',
   PAB_DESCRIPCION      varchar(200) not null comment 'descripcion del Pabellon',
   PAB_CAPACIDAD        int not null comment 'Capacidad del pabellon',
   PAB_DETALLES         varchar(1000) not null comment 'Detalles del pabellon',
   primary key (PAB_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4;

alter table sys_pabellones comment 'Datos de los Pabellones de un Centro';

/*==============================================================*/
/* Table: sys_parentesco                                        */
/*==============================================================*/
create table sys_parentesco
(
   PAR_COD              int(11) not null auto_increment comment 'Codigo del Parentesco',
   PAR_DESCRIPCION      varchar(200) not null comment 'Descripcion del Parentesco',
   primary key (PAR_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12;

alter table sys_parentesco comment 'Parentescos que pueden tener los visitantes';

/*==============================================================*/
/* Table: sys_ppl                                               */
/*==============================================================*/
create table sys_ppl
(
   PPL_COD              int(11) not null auto_increment comment 'Codigo del PPL',
   CEL_COD              int comment 'Codigo de la celda',
   PPL_NOMBRE           varchar(200) not null comment 'Nombre del PPL',
   PPL_APELLIDO         varchar(200) not null comment 'Apellidos del PPL',
   PPL_CEDULA           varchar(13) not null comment 'Cedula del PPL',
   PPL_IMG              varchar(200) not null comment 'Imagen del PPL',
   PPL_ESTADO           varchar(2) not null comment 'Estado del PPL',
   primary key (PPL_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3;

alter table sys_ppl comment 'Datos de la persona Provada de Libertad';

/*==============================================================*/
/* Table: sys_ppl_pabellon                                      */
/*==============================================================*/
create table sys_ppl_pabellon
(
   CPP_COD              int(11) not null auto_increment comment 'Codigo del Registro',
   PAB_COD              int not null comment 'Codigo del Pabellon',
   PPL_COD              int not null comment 'Codigo del PPL',
   CPP_ESTADO           varchar(1) not null comment 'Estado del registro',
   primary key (CPP_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3;

alter table sys_ppl_pabellon comment 'Datos del Pabellon con el PPL';

/*==============================================================*/
/* Table: sys_roles                                             */
/*==============================================================*/
create table sys_roles
(
   ROL_COD              int(11) not null auto_increment comment 'Codigo del Rol',
   ROL_DESCRIPCION      varchar(200) not null comment 'Descripcion del Rol',
   ROL_ESTADO           varchar(1) not null comment 'A: Activo, I: Inactivo',
   primary key (ROL_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7;

alter table sys_roles comment 'Roles que puede tener un Usuario';

/*==============================================================*/
/* Table: sys_sanciones                                         */
/*==============================================================*/
create table sys_sanciones
(
   SAN_COD              int not null comment 'Codigo de la Sancion',
   TPS_COD              int comment 'Codigo del tipo-Sancion',
   SAN_DESCRIPCION      varchar(200) comment 'Descripcion de la Sancion',
   SAN_TIEMPO           int comment 'Tiempo en Numeros Sancionado',
   SAN_TIEMPO_DES       varchar(60) comment 'Descripcion del Tiempo de la Sancion',
   primary key (SAN_COD)
);

alter table sys_sanciones comment 'Tabla de almacenamiento de Sanciones de las Visitas';

/*==============================================================*/
/* Table: sys_tipo_sancion                                      */
/*==============================================================*/
create table sys_tipo_sancion
(
   TPS_COD              int not null comment 'Codigo del tipo-Sancion',
   TPS_DESCRIPCION      varchar(200) comment 'descripcion del  tipo-Sancion',
   primary key (TPS_COD)
);

alter table sys_tipo_sancion comment 'Listado de Tipos que puede tener una sancion';

/*==============================================================*/
/* Table: sys_usuario_centro                                    */
/*==============================================================*/
create table sys_usuario_centro
(
   UCE_COD              int(11) not null auto_increment comment 'Codigo de la tabla',
   USU_COD              int not null comment 'Codigo del usuario',
   CEN_COD              int not null comment 'Codigo del Centro',
   ROL_COD              int not null comment 'Codigo del Rol',
   primary key (UCE_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3;

alter table sys_usuario_centro comment 'Usuarios que pertenece aun centro';

/*==============================================================*/
/* Table: sys_usuarios                                          */
/*==============================================================*/
create table sys_usuarios
(
   USU_COD              int(11) not null auto_increment comment 'Codigo de Usuario',
   USU_NOMBRE           varchar(100) character set utf8 not null comment 'Nombre  del Usuario',
   USU_APELLIDO         varchar(100) character set utf8 not null comment 'Apellido del Usuario',
   USU_USUARIO          varchar(60) character set utf8 not null comment 'Usuario',
   USU_CLAVE            varchar(60) character set utf8 not null comment 'Clave del Usuario',
   USU_CEDULA           varchar(13) character set utf8 not null comment 'Cedula del Usuario',
   USU_EMAIL            varchar(200) character set utf8 not null comment 'Email del Usuario',
   USU_CELULAR          varchar(20) character set utf8 not null comment 'Celular del Usuario',
   USU_AVATAR           varchar(200) character set utf8 not null comment 'Imagen del Usuario',
   ROL_COD              int not null comment 'Codigo del Grupo',
   primary key (USU_COD)
)
ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Tabla de Usuarios del Sistema' AUTO_INCREMENT=3;

alter table sys_usuarios comment 'Almacen de usuarios que ingresan al sistema';

/*==============================================================*/
/* Table: sys_visitante                                         */
/*==============================================================*/
create table sys_visitante
(
   VIS_COD              int(11) not null auto_increment comment 'Codigo secuencial del Visitante',
   VIS_NOMBRE           varchar(250) not null comment 'nombre de la Visita',
   VIS_APELLIDO         varchar(250) not null comment 'Apellido de la Visita',
   PAR_COD              int not null comment 'Codigo del parentesco',
   VIS_CEDULA           varchar(13) not null comment 'Cedula de la Visita',
   VIS_DIRECCION        varchar(500) not null comment 'Direccion del Visitante',
   VIS_TELEFONO         varchar(12) not null comment 'Telefono del visitante',
   VIS_CORREO           varchar(200) not null comment 'Correo del Visitante',
   VIS_IMAGEN           varchar(200) not null comment 'Imagen del visitante',
   VIS_ESTADO           varchar(2) comment 'Estado del Visitante',
   primary key (VIS_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;

alter table sys_visitante comment 'Almacen de Visitantes que pueden Acceder a un Centro';

/*==============================================================*/
/* Table: sys_visitante_ppl                                     */
/*==============================================================*/
create table sys_visitante_ppl
(
   VIP_COD              int not null comment 'Codigo del Visitanten-PPL',
   PPL_COD              int not null comment 'Codigo del PPL',
   VIS_COD              int not null comment 'Codigo secuencial del Visitante',
   VIP_FECHA            date not null comment 'Fecha del Visitanten-PPL',
   primary key (VIP_COD)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3;

alter table sys_visitante_ppl comment 'Listado de Visitantes que se encuentran ligados a un PPL';

/*==============================================================*/
/* Table: sys_visitante_sancion                                 */
/*==============================================================*/
create table sys_visitante_sancion
(
   VSA_COD              int not null comment 'Codigo del Visitante-Sancion',
   SAN_COD              int comment 'Codigo de la Sancion',
   VIS_COD              int comment 'Codigo secuencial del Visitante',
   USU_COD              int comment 'Codigo de Usuario',
   VSA_NOTA             varchar(500) comment 'Nota del Visitante-Sancion',
   VSA_FECHA            datetime comment 'Fecha del Visitante-Sancion',
   primary key (VSA_COD)
);

alter table sys_visitante_sancion comment 'Las sanciones que obtiene un visitante';

/*==============================================================*/
/* Table: sys_visitas                                           */
/*==============================================================*/
create table sys_visitas
(
   VISG_COD             int(11) not null auto_increment comment 'Codigo de la Visita',
   VIS_COD              int not null comment 'Codigo secuencial del Visitante',
   PPL_COD              int not null comment 'Codigo del PPL',
   VISG_FECHA           date not null comment 'Fecha de la Visita',
   VISG_HORA_INGRESO    time not null comment 'Hora de Ingreso a la Visita',
   VISG_HORA_SALIDA     time not null comment 'Hora de Salida de la Visita',
   VISG_ESTADO          varchar(2) comment 'Estado de la Visita',
   primary key (VISG_COD)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

alter table sys_visitas comment 'Registro de Visitas realizadas';

alter table sys_accesos add constraint FK_RELATIONSHIP_28 foreign key (USU_COD)
      references sys_usuarios (USU_COD) on delete restrict on update restrict;

alter table sys_accesos add constraint FK_RELATIONSHIP_29 foreign key (CEN_COD)
      references sys_centro (CEN_COD) on delete restrict on update restrict;

alter table sys_celdas add constraint FK_REFERENCE_17 foreign key (PAB_COD)
      references sys_pabellones (PAB_COD) on delete restrict on update restrict;

alter table sys_centro add constraint FK_REFERENCE_8 foreign key (CIU_COD)
      references sys_ciudad (CIU_COD) on delete restrict on update restrict;

alter table sys_control add constraint FK_REFERENCE_14 foreign key (GAR_COD)
      references sys_garita (GAR_COD) on delete restrict on update restrict;

alter table sys_control add constraint FK_REFERENCE_15 foreign key (VIS_COD)
      references sys_visitante (VIS_COD) on delete restrict on update restrict;

alter table sys_historia_ppl add constraint FK_REFERENCE_19 foreign key (USU_COD)
      references sys_usuarios (USU_COD) on delete restrict on update restrict;

alter table sys_historia_ppl add constraint FK_REFERENCE_20 foreign key (PPL_COD)
      references sys_ppl (PPL_COD) on delete restrict on update restrict;

alter table sys_historia_ppl add constraint FK_REFERENCE_21 foreign key (PAB_COD)
      references sys_pabellones (PAB_COD) on delete restrict on update restrict;

alter table sys_historia_ppl add constraint FK_REFERENCE_22 foreign key (CEL_COD)
      references sys_celdas (CEL_COD) on delete restrict on update restrict;

alter table sys_horarios add constraint FK_REFERENCE_26 foreign key (PAB_COD)
      references sys_pabellones (PAB_COD) on delete restrict on update restrict;

alter table sys_item_tipos add constraint FK_REFERENCE_24 foreign key (TPS_COD)
      references sys_tipo_sancion (TPS_COD) on delete restrict on update restrict;

alter table sys_pabellones add constraint FK_REFERENCE_11 foreign key (CEN_COD)
      references sys_centro (CEN_COD) on delete restrict on update restrict;

alter table sys_pabellones add constraint FK_REFERENCE_16 foreign key (NVL_COD)
      references sys_etapas (NVL_COD) on delete restrict on update restrict;

alter table sys_ppl add constraint FK_REFERENCE_18 foreign key (CEL_COD)
      references sys_celdas (CEL_COD) on delete restrict on update restrict;

alter table sys_ppl_pabellon add constraint FK_REFERENCE_10 foreign key (PPL_COD)
      references sys_ppl (PPL_COD) on delete restrict on update restrict;

alter table sys_ppl_pabellon add constraint FK_REFERENCE_9 foreign key (PAB_COD)
      references sys_pabellones (PAB_COD) on delete restrict on update restrict;

alter table sys_sanciones add constraint FK_REFERENCE_23 foreign key (TPS_COD)
      references sys_tipo_sancion (TPS_COD) on delete restrict on update restrict;

alter table sys_usuario_centro add constraint FK_REFERENCE_1 foreign key (CEN_COD)
      references sys_centro (CEN_COD) on delete restrict on update restrict;

alter table sys_usuario_centro add constraint FK_REFERENCE_2 foreign key (USU_COD)
      references sys_usuarios (USU_COD) on delete restrict on update restrict;

alter table sys_usuario_centro add constraint FK_REFERENCE_3 foreign key (ROL_COD)
      references sys_roles (ROL_COD) on delete restrict on update restrict;

alter table sys_visitante add constraint FK_REFERENCE_6 foreign key (PAR_COD)
      references sys_parentesco (PAR_COD) on delete restrict on update restrict;

alter table sys_visitante_ppl add constraint FK_REFERENCE_12 foreign key (VIS_COD)
      references sys_visitante (VIS_COD) on delete restrict on update restrict;

alter table sys_visitante_ppl add constraint FK_REFERENCE_13 foreign key (PPL_COD)
      references sys_ppl (PPL_COD) on delete restrict on update restrict;

alter table sys_visitante_sancion add constraint FK_REFERENCE_27 foreign key (SAN_COD)
      references sys_sanciones (SAN_COD) on delete restrict on update restrict;

alter table sys_visitante_sancion add constraint FK_REFERENCE_28 foreign key (VIS_COD)
      references sys_visitante (VIS_COD) on delete restrict on update restrict;

alter table sys_visitante_sancion add constraint FK_REFERENCE_29 foreign key (USU_COD)
      references sys_usuarios (USU_COD) on delete restrict on update restrict;

alter table sys_visitas add constraint FK_REFERENCE_4 foreign key (VIS_COD)
      references sys_visitante (VIS_COD) on delete restrict on update restrict;

alter table sys_visitas add constraint FK_REFERENCE_5 foreign key (PPL_COD)
      references sys_ppl (PPL_COD) on delete restrict on update restrict;

