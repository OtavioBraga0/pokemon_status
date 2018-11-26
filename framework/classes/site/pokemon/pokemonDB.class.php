<?php

class PokemonDB
{
    
    private static $mArrCampos = '';
    private static $mArrJoin   = '';
    private static $sOrdem     = 'Pokemon_lng_Codigo';
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
    
    public static function pesquisaPokemonLista( )
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
                           Pokemon_lng_Codigo,
                           Pokemon_vch_Name,
                           Pokemon_vch_Type1,
                           Pokemon_vch_Type2,
                           Pokemon_lng_Hp,
                           Pokemon_lng_Attack,
                           Pokemon_lng_Defense,
                           Pokemon_lng_SpAttack,
                           Pokemon_lng_SpDefense,
                           Pokemon_lng_Speed,
                           Pokemon_lng_Generation,
                           Pokemon_bln_Legendary
                           FROM Pokemon
                           WHERE 1 = 1 ".$sFiltros."                       
                           ORDER BY ".self::$sOrdem."
                           ".$sLimite."
                         ");  

//        echo $mResultado->queryString;
        $mResultado->execute();

        $mArrDados = $mResultado->fetchAll(PDO::FETCH_ASSOC);
        
         /* Instancia o Objeto */
        $arrObjPokemon = new ArrayObject();
        
        if (is_array($mArrDados))
        { 
            for ($a = 0, $iCount = count($mArrDados); $a < $iCount; ++$a)
            {
                 /* Instancia o Objeto */
                $oPokemon  = new Pokemon;
                
                $oPokemon->iCodigo   = $mArrDados[$a]['Pokemon_lng_Codigo'];
                $oPokemon->sName     = $mArrDados[$a]['Pokemon_vch_Name'];
                $oPokemon->sType1    = $mArrDados[$a]['Pokemon_vch_Type1'];
                $oPokemon->sType2    = $mArrDados[$a]['Pokemon_vch_Type2'];
                $oPokemon->iHp       = $mArrDados[$a]['Pokemon_lng_Hp'];
                $oPokemon->iAttack   = $mArrDados[$a]['Pokemon_lng_Attack'];
                $oPokemon->iDefense  = $mArrDados[$a]['Pokemon_lng_Defense'];
                $oPokemon->iSpAttack = $mArrDados[$a]['Pokemon_lng_SpAttack'];
                $oPokemon->iSpDefense = $mArrDados[$a]['Pokemon_lng_SpDefense'];
                $oPokemon->iSpeed    = $mArrDados[$a]['Pokemon_lng_Speed'];
                $oPokemon->iGeneration = $mArrDados[$a]['Pokemon_lng_Generation'];
                $oPokemon->bLegendary = $mArrDados[$a]['Pokemon_bln_Legendary'];
                
               
                $arrObjPokemon->append($oPokemon);
            }
        } 
        return $arrObjPokemon;
    }
    
    public static function pesquisaPokemonListaJson( )
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
                           Pokemon_lng_Codigo,
                           Pokemon_vch_Name,
                           Pokemon_vch_Type1,
                           Pokemon_vch_Type2,
                           Pokemon_lng_Hp,
                           Pokemon_lng_Attack,
                           Pokemon_lng_Defense,
                           Pokemon_lng_SpAttack,
                           Pokemon_lng_SpDefense,
                           Pokemon_lng_Speed,
                           Pokemon_lng_Generation,
                           Pokemon_bln_Legendary
                           FROM Pokemon
                           WHERE 1 = 1 ".$sFiltros."                       
                           ORDER BY ".self::$sOrdem."
                           ".$sLimite."
                         ");  

//        echo $mResultado->queryString;
        $mResultado->execute();

        $mArrDados = $mResultado->fetchAll(PDO::FETCH_ASSOC);
        
        $arrObjPokemon = array();
        
        if (is_array($mArrDados))
        {
            
            for ($a = 0, $iCount = count($mArrDados); $a < $iCount; ++$a)
            {
                $oPokemon = array(
                    'iCodigo'       => $mArrDados[$a]['Pokemon_lng_Codigo'],
                    'sName'         => $mArrDados[$a]['Pokemon_vch_Name'],
                    'sType1'        => $mArrDados[$a]['Pokemon_vch_Type1'],
                    'sType2'        => $mArrDados[$a]['Pokemon_vch_Type2'],
                    'iHp'           => $mArrDados[$a]['Pokemon_lng_Hp'],
                    'iAttack'       => $mArrDados[$a]['Pokemon_lng_Attack'],
                    'iDefense'      => $mArrDados[$a]['Pokemon_lng_Defense'],
                    'iSpAttack'     => $mArrDados[$a]['Pokemon_lng_SpAttack'],
                    'iSpDefense'    => $mArrDados[$a]['Pokemon_lng_SpDefense'],
                    'iSpeed'        => $mArrDados[$a]['Pokemon_lng_Speed'],
                    'iGeneration'   => $mArrDados[$a]['Pokemon_lng_Generation'],
                    'bLegendary'    => $mArrDados[$a]['Pokemon_bln_Legendary']
                );
                
               
                $arrObjPokemon[] = $oPokemon;
            }
        } 
        return json_encode($arrObjPokemon);
    }
    
    public static function pesquisaPokemonGrafoJson( )
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
             
        $mResultado = $oConexao->prepare("SELECT DISTINCT
                                    Combat_lng_Pokemon1,
                                    p1.Pokemon_vch_Name as Pokemon1,
                                    Combat_lng_Pokemon2,
                                    p2.Pokemon_vch_Name as Pokemon2,
                                    Combat_lng_Winner                    
                                FROM Combat
                                    INNER JOIN Pokemon AS p1 ON Combat_lng_Pokemon1 = p1.Pokemon_lng_Codigo
                                    INNER JOIN Pokemon AS p2 ON Combat_lng_Pokemon2 = p2.Pokemon_lng_Codigo
                                    INNER JOIN Pokemon AS p3 ON Combat_lng_Winner   = p3.Pokemon_lng_Codigo
                                WHERE 1 = 1 ".$sFiltros."                     
                                ORDER BY Combat_lng_Pokemon2
                         ");  

    //    echo $mResultado->queryString;
        $mResultado->execute();

        $mArrDados = $mResultado->fetchAll(PDO::FETCH_ASSOC);
        
        $arrObjPokemon = array();
        
        if (is_array($mArrDados))
        {
            
            for ($a = 0, $iCount = count($mArrDados); $a < $iCount; ++$a)
            {
                
                    $oPokemon = array(
                        'id'       => $mArrDados[$a]['Combat_lng_Winner'] != $mArrDados[$a]['Combat_lng_Pokemon1'] ? $mArrDados[$a]['Combat_lng_Pokemon1'] : $mArrDados[$a]['Combat_lng_Pokemon2'],
                        'label'    => $mArrDados[$a]['Combat_lng_Winner'] != $mArrDados[$a]['Combat_lng_Pokemon1'] ? $mArrDados[$a]['Pokemon1'] : $mArrDados[$a]['Pokemon2'],
                    );
                
                $arrObjPokemon[] = $oPokemon;

                if($iCount - 1  == $a){
                    $oPokemon = array(
                        'id'       => $mArrDados[$a]['Combat_lng_Winner'],
                        'label'    => $mArrDados[$a]['Combat_lng_Winner'] == $mArrDados[$a]['Combat_lng_Pokemon1'] ? $mArrDados[$a]['Pokemon1'] : $mArrDados[$a]['Pokemon2'],
                    );
                    $arrObjPokemon[] = $oPokemon;
                }
            }
        } 
        return $arrObjPokemon;
    }
    
    public static function pesquisaCombatGrafoJson( )
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
             
        $mResultado = $oConexao->prepare("SELECT DISTINCT
                                    Combat_lng_Pokemon1,
                                    p1.Pokemon_vch_Name,
                                    Combat_lng_Pokemon2,
                                    p2.Pokemon_vch_Name,
                                    Combat_lng_Winner                       
                                FROM Combat
                                    INNER JOIN Pokemon AS p1 ON Combat_lng_Pokemon1 = p1.Pokemon_lng_Codigo
                                    INNER JOIN Pokemon AS p2 ON Combat_lng_Pokemon2 = p2.Pokemon_lng_Codigo
                                WHERE 1 = 1 ".$sFiltros."                     
                                ORDER BY Combat_lng_Pokemon1
                         ");  

    //    echo $mResultado->queryString;
        $mResultado->execute();

        $mArrDados = $mResultado->fetchAll(PDO::FETCH_ASSOC);
        
        $arrObjPokemon = array();
        
        if (is_array($mArrDados))
        {
            
            for ($a = 0, $iCount = count($mArrDados); $a < $iCount; ++$a)
            {
                $oPokemon = array(
                    'from'       => $mArrDados[$a]['Combat_lng_Winner'],
                    'to'         => $mArrDados[$a]['Combat_lng_Winner'] != $mArrDados[$a]['Combat_lng_Pokemon1'] ? $mArrDados[$a]['Combat_lng_Pokemon1'] : $mArrDados[$a]['Combat_lng_Pokemon2'],
                );
                
               
                $arrObjPokemon[] = $oPokemon;
            }
        } 
        return $arrObjPokemon;
    }

    public static function pesquisaPokemon( $tipo = false )
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
                           Pokemon_lng_Codigo,
                           Pokemon_txt_Conteudo,
                           Pokemon_vch_Token,
                           Pokemon_vch_Code,
                           Pokemon_bit_Visto
                           FROM Pokemon
                           WHERE 1 = 1 ".$sFiltros."                       
                         ");  
        
        $mResultado->execute();
        
        $mArrDados = $mResultado->fetch(PDO::FETCH_ASSOC);
        ;
         /* Instancia o Objeto */
        $oPokemon = new Pokemon;
      
        if (is_array($mArrDados))
        {          
           $oPokemon->iCodigo    = $mArrDados['Pokemon_lng_Codigo'];
           $oPokemon->sConteudo  = $mArrDados['Pokemon_txt_Conteudo'];
           $oPokemon->sToken     = $mArrDados['Pokemon_vch_Token'];
           $oPokemon->sCode      = $mArrDados['Pokemon_vch_Code'];
           $oPokemon->iVisto     = $mArrDados['Pokemon_bit_Visto'];
        }
        
        return $oPokemon;     
    }
    
    public static final function alteraPokemon( $oPokemon )
    {                 
        $oConexao = db::conectar();
        
        $sSql=$oConexao->prepare("UPDATE Pokemon SET
                    Pokemon_txt_Conteudo     = :conteudo,
                    Pokemon_vch_Token        = :token,
                    Pokemon_vch_Code         = :code,
                    Pokemon_bit_Visto        = :visto
                    WHERE Pokemon_lng_Codigo = :codigo " );
 
        $sSql->bindParam(':codigo',     ($oPokemon->iCodigo));
        $sSql->bindParam(':conteudo',   ($oPokemon->sConteudo));
        $sSql->bindParam(':token',      ($oPokemon->sToken));
        $sSql->bindParam(':visto',      ($oPokemon->sVisto));
        $sSql->bindParam(':code',       ($oPokemon->sCode));
        
        $sSql->execute();
    }
    
    public static final function salvaPokemon( $oPokemon )
    { 
        $oConexao = db::conectar();
        
        $sSql = $oConexao->prepare("INSERT INTO Pokemon (
                    Pokemon_txt_Conteudo,
                    Pokemon_vch_Token,
                    Pokemon_vch_Code,
                    Pokemon_bit_Visto
                    ) VALUES ( ?,?,?,? )"); 
        
        $sSql->bindParam(1, ($oPokemon->sConteudo));
        $sSql->bindParam(2, ($oPokemon->sToken));
        $sSql->bindParam(3, ($oPokemon->sCode));
        $sSql->bindParam(4, ($oPokemon->iVisto));
        $sSql->execute();
        
        return $oConexao->lastInsertId(); 
        //$sSql->debugDumpParams(); 
    }
    
    public static final function excluiPokemon( $iCodigo  )
    {
        $oConexao = db::conectar();
        
        $sSql = $oConexao->prepare("DELETE FROM Pokemon 
                    WHERE Pokemon_lng_Codigo = :codigo ");
       
        $sSql->bindParam(':codigo',$iCodigo, PDO::PARAM_INT);   
        $sSql->execute();
    }
}

?>