<?php
 class Conexion{

    private static $instance = null;
    private $pdo;

    private $driver='mysql';
    private $host='sql10.freemysqlhosting.net';
    private $user='sql10617482';
    private $pass='5XmCCvUppG';
    private $dbName='sql10617482';
    private $charset='utf8';
    
    //patron singleton
    private function __construct(){
        try {
            $this->pdo = new PDO("{$this->driver}:host={$this->host};dbname={$this->dbName};",$this->user,$this->pass);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        } catch (PDOExceptio $e) {
            echo $e->getMessage();
        }
    }

    public static function getInstance(){
        if (!self::$instance) {
            self::$instance = new Conexion();
        }
        return self::$instance;
    }

    public function getConnection()
    {
      return $this->pdo;
    }


     
 }

