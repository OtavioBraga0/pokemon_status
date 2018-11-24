<?php


Controller::loadClass('site/pokemon/pokemon');
Controller::loadClass('site/pokemon/pokemonDB');

PokemonDB::setaFiltro(' AND Combat_lng_Winner = 1');
$arrObjPokemon = PokemonDB::pesquisaPokemonGrafoJSON();

echo $arrObjPokemon;
return;

?>