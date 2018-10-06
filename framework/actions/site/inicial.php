<?php

Controller::loadClass('site/pokemon/pokemon');
Controller::loadClass('site/pokemon/pokemonDB');

/* Inicializa o Template */

$oTemplate = Template::inicializaSmarty();


if(isset($_POST['idPokemon1']) && isset($_POST['idPokemon2'])){
    PokemonDB::setaFiltro(" AND (Pokemon_lng_Codigo = ".$_POST['idPokemon1']." OR Pokemon_lng_Codigo = ".$_POST['idPokemon2'].")");
    $arrObjPokemon = PokemonDB::pesquisaPokemonListaJson();
    
    echo $arrObjPokemon;
    return;
}

$arrObjPokemon = PokemonDB::pesquisaPokemonLista();


$oTemplate->assign('arrObjPokemon', $arrObjPokemon);
$oTemplate->display('site/inicial.tpl');


?>