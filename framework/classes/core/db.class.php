<?php

class db
{
    protected static $oConexao;

    private function __construct()
    {
        try
        {
            // self::$oConexao = new PDO( "mysql:host=".CONFIG::HOST.";port=3306;dbname=".CONFIG::DB, CONFIG::USER, CONFIG::PSWD,array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES latin1'));
            self::$oConexao = new PDO( "mysql:host=".CONFIG::HOST.";port=3306;dbname=".CONFIG::DB, CONFIG::USER, CONFIG::PSWD,array(1002 => 'SET NAMES latin1'));
        }
        catch (PDOException $e)
        {
            echo "Erro de conex�o: " . $e->getMessage();
			echo PDO::errorInfo;
        }
	}

    public static function conectar()
    {
        if (!self::$oConexao)
        {
            new db();
        }
        return self::$oConexao;
    }
}

?>