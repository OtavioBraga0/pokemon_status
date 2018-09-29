<?php

class Config
{
    //Dados do Sistema
    const NOME_SITE = "Hospital de Amor - Barretos";
	const EMAIL_SITE = "";
	const SITE_CODIGO = 1;

    // Informa��es de Conex�o - DB MySQL
    //  const HOST = 'localhost';
    //  const USER = 'root';
    //  const PSWD = '';
    //  const DB   = 'conceicaopraia';

	// Configura��es de SMTP
    const SMTP_EMAIL = "";
    const SMTP_HOST  = "";
    const SMTP_PWD   = "";

    private final function __construct()
    {

    }

    private final function __clone()
    {

    }

    private final function __wakeup()
    {

    }

    public static final function loadConfig()
    {
        /* Carrega Configura��es Padr�es se Forem Necess�rias */

    }

    public static final function loadController()
    {
        try
        {
            if (file_exists( PATH_FW .'/classes/core/controller.class.php'))
            {
                include_once (  PATH_FW .'/classes/core/controller.class.php' );
            }
            else
            {
                throw new Exception('CONFIG:Arquivo do Controller n&#227;o encontrado.', 1000);
            }
        }
        catch (Exception $e)
        {
            die('#' . $e->getCode() . ' : ' . $e->getMessage());
        }
    }

}

?>