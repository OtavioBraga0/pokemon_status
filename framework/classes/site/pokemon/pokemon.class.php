<?php

class Pokemon
{
    
    /* Atributos */
    private $iCodigo;
    private $sName;
    private $sType1;
    private $sType2;
    private $iHp;
    private $iAttack;
    private $iDefense;
    private $iSpAttack;
    private $iSpDefense;
    private $iSpeed;
    private $iGeneration;
    private $bLegendary;
    
    
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