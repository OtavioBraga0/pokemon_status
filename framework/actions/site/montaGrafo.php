<?php


Controller::loadClass('site/pokemon/pokemon');
Controller::loadClass('site/pokemon/pokemonDB');


PokemonDB::setaFiltro(' AND Combat_lng_Winner = '.$_POST['idPokemon']);
PokemonDB::setaOrdem(' Combat_lng_Pokemon2 ASC');
$arrObjPokemon = PokemonDB::pesquisaPokemonGrafoJSON();

PokemonDB::setaFiltro(' AND Combat_lng_Winner = '.$_POST['idPokemon']);
$arrObjCombat = PokemonDB::pesquisaCombatGrafoJSON();

$arrObjDados = array(
    'nodes' => $arrObjPokemon, 
    'edges' => $arrObjCombat
);

echo json_encode($arrObjDados);
return;

?>