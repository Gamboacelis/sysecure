<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
 
include("xmlrpc_lib/xmlrpc.inc");
include("xmlrpc_lib/xmlrpcs.inc");
$GLOBALS['xmlrpc_internalencoding']='UTF-8';
 
$user = 'admin';
$password = 'admnin@esigpen';
$dbname = 'esigpen_test09';
 
$server_url = 'http://23.253.160.210:8069';
$connexion = new xmlrpc_client($server_url . "/xmlrpc/common");
$connexion->setSSLVerifyPeer(0);
 
$c_msg = new xmlrpcmsg('login');
$c_msg->addParam(new xmlrpcval($dbname, "string"));
$c_msg->addParam(new xmlrpcval($user, "string"));
$c_msg->addParam(new xmlrpcval($password, "string"));
$c_response = $connexion->send($c_msg);
 
if ($c_response->errno != 0){
echo '<p>error : ' . $c_response->faultString() . '</p>';
}
else{
$uid = $c_response->value()->scalarval();
 
$val = array (
"name" => new xmlrpcval("cristian", "string")
);
$client = new xmlrpc_client($server_url . "/xmlrpc/object");
$client->setSSLVerifyPeer(0);
 
$msg = new xmlrpcmsg('execute');
$msg->addParam(new xmlrpcval($dbname, "string"));
$msg->addParam(new xmlrpcval($uid, "int"));
$msg->addParam(new xmlrpcval($password, "string"));
$msg->addParam(new xmlrpcval("prison.person", "string"));
$msg->addParam(new xmlrpcval("name_get", "string"));
$msg->addParam(new xmlrpcval($val, "struct"));
$response = $client->send($msg);
}
