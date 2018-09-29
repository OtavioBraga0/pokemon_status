<?php

class DoadorDB
{
    
    private static $mArrCampos = '';
    private static $mArrJoin   = '';
    private static $sOrdem     = 'Doador_lng_Codigo';
    private static $iLimite = 0;
    private static $iInicio = 0;
    
    public static function setaFiltro($sArgCampo)
    {
        self::$mArrCampos['CONDICAO'][] = $sArgCampo;
    }
    
    public static function setaJoin($sArgJoin)
    {
        self::$mArrJoin['JOIN'][] = $sArgJoin;
    }
    
    public static function setaOrdem($sArgOrdem)
    {
        self::$sOrdem = $sArgOrdem;
    }
    
    public static final function setaLimite($iArgLimite, $iArgInicio = 0)
    {
        self::$iLimite = $iArgLimite;
        self::$iInicio = $iArgInicio;
    }
    
    public static function pesquisaDoadorLista( )
    {
        $oConexao = db::conectar();
        
        $sFiltros = '';
        $sLimite  = '';
        
        // Define os Filtros
        if (isset(self::$mArrCampos['CONDICAO']))
        {
            if ( self::$mArrCampos['CONDICAO'] <> '' )
            {
                for ($a = 0, $iCount = count(self::$mArrCampos['CONDICAO']); $a < $iCount; ++$a)
                {
                    $sFiltros .= (self::$mArrCampos['CONDICAO'][$a]);
                }
                //Limpa Filtros
                self::$mArrCampos['CONDICAO'] = '';
            }
        }
        
        /* Define o Limite */
        if (self::$iLimite > 0)
        {
            $sLimite = (' LIMIT '.self::$iInicio.",".self::$iLimite);

            //Limpa Filtro
            self::$iInicio = 0;
            self::$iLimite = 0;
        }
             
        $mResultado = $oConexao->prepare("SELECT
                           Doador_lng_Codigo,
                           Doador_txt_Conteudo,
                           Doador_vch_Token,
                           Doador_vch_Code,
                           Doador_bit_Visto
                           FROM Doador
                           WHERE 1 = 1 ".$sFiltros."                       
                           ORDER BY ".self::$sOrdem."
                           ".$sLimite."
                         ");  

//        echo $mResultado->queryString;
        $mResultado->execute();

        $mArrDados = $mResultado->fetchAll(PDO::FETCH_ASSOC);
        
         /* Instancia o Objeto */
        $arrObjDoador = new ArrayObject();
        
        if (is_array($mArrDados))
        { 
            for ($a = 0, $iCount = count($mArrDados); $a < $iCount; ++$a)
            {
                 /* Instancia o Objeto */
                $oDoador  = new Doador;
                
                $oDoador->iCodigo   = $mArrDados[$a]['Doador_lng_Codigo'];
                $oDoador->sConteudo = $mArrDados[$a]['Doador_txt_Conteudo'];
                $oDoador->sToken    = $mArrDados[$a]['Doador_vch_Token'];
                $oDoador->sCode     = $mArrDados[$a]['Doador_vch_Code'];
                $oDoador->iVisto    = $mArrDados[$a]['Doador_bit_Visto'];
               
                $arrObjDoador->append($oDoador);
            }
        } 
        return $arrObjDoador;
    }
    
    public static function pesquisaDoador( $tipo = false )
    {
        $oConexao = db::conectar();
        
        $sFiltros = '';
        
        // Define os Filtros
        if (isset(self::$mArrCampos['CONDICAO']))
        {
            for ($a = 0, $iCount = count(self::$mArrCampos['CONDICAO']); $a < $iCount; ++$a)
            {
                $sFiltros .= (self::$mArrCampos['CONDICAO'][$a]);
            }
            //Limpa Filtros
            self::$mArrCampos['CONDICAO'] = '';
        }
             
        $mResultado = $oConexao->prepare("SELECT
                           Doador_lng_Codigo,
                           Doador_txt_Conteudo,
                           Doador_vch_Token,
                           Doador_vch_Code,
                           Doador_bit_Visto
                           FROM Doador
                           WHERE 1 = 1 ".$sFiltros."                       
                         ");  
        
        $mResultado->execute();
        
        $mArrDados = $mResultado->fetch(PDO::FETCH_ASSOC);
        ;
         /* Instancia o Objeto */
        $oDoador = new Doador;
      
        if (is_array($mArrDados))
        {          
           $oDoador->iCodigo    = $mArrDados['Doador_lng_Codigo'];
           $oDoador->sConteudo  = $mArrDados['Doador_txt_Conteudo'];
           $oDoador->sToken     = $mArrDados['Doador_vch_Token'];
           $oDoador->sCode      = $mArrDados['Doador_vch_Code'];
           $oDoador->iVisto     = $mArrDados['Doador_bit_Visto'];
        }
        
        return $oDoador;     
    }
    
    public static final function alteraDoador( $oDoador )
    {                 
        $oConexao = db::conectar();
        
        $sSql=$oConexao->prepare("UPDATE Doador SET
                    Doador_txt_Conteudo     = :conteudo,
                    Doador_vch_Token        = :token,
                    Doador_vch_Code         = :code,
                    Doador_bit_Visto        = :visto
                    WHERE Doador_lng_Codigo = :codigo " );
 
        $sSql->bindParam(':codigo',     ($oDoador->iCodigo));
        $sSql->bindParam(':conteudo',   ($oDoador->sConteudo));
        $sSql->bindParam(':token',      ($oDoador->sToken));
        $sSql->bindParam(':visto',      ($oDoador->sVisto));
        $sSql->bindParam(':code',       ($oDoador->sCode));
        
        $sSql->execute();
    }
    
    public static final function salvaDoador( $oDoador )
    { 
        $oConexao = db::conectar();
        
        $sSql = $oConexao->prepare("INSERT INTO Doador (
                    Doador_txt_Conteudo,
                    Doador_vch_Token,
                    Doador_vch_Code,
                    Doador_bit_Visto
                    ) VALUES ( ?,?,?,? )"); 
        
        $sSql->bindParam(1, ($oDoador->sConteudo));
        $sSql->bindParam(2, ($oDoador->sToken));
        $sSql->bindParam(3, ($oDoador->sCode));
        $sSql->bindParam(4, ($oDoador->iVisto));
        $sSql->execute();
        
        return $oConexao->lastInsertId(); 
        //$sSql->debugDumpParams(); 
    }
    
    public static final function excluiDoador( $iCodigo  )
    {
        $oConexao = db::conectar();
        
        $sSql = $oConexao->prepare("DELETE FROM Doador 
                    WHERE Doador_lng_Codigo = :codigo ");
       
        $sSql->bindParam(':codigo',$iCodigo, PDO::PARAM_INT);   
        $sSql->execute();
    }
}

?>