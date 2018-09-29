<?php

class Doador
{
    
    /* Atributos */
    private $iCodigo;
    private $sConteudo;
    private $sToken;
    private $sCode;
    private $iVisto;
    
    
    /* M�todos m�gicos GET e SET */
    public function __get($property) 
    {
        if (property_exists($this, $property)) 
        {
          return $this->$property;
        }
    }
    
    public function __set($property, $value) 
    {
        if (property_exists($this, $property)) 
        {
          $this->$property = $value;
        }
        return $this;
    }

}

?>