<html>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <!-- Plotly.js -->
      <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    </head>

    <body>

        <label>Pokemon 1</label>
        <select id="pokemon1">
            {foreach $arrObjPokemon as $oPokemon}
                <option value="{$oPokemon->iCodigo}">{$oPokemon->sName}</option>
            {/foreach}
        </select>
        
        
        <label>Pokemon 2</label>
        <select id="pokemon2">
            {foreach $arrObjPokemon as $oPokemon}
                <option value="{$oPokemon->iCodigo}">{$oPokemon->sName}</option>
            {/foreach}
        </select>
        
        <button id="comparar">Comparar</button>
        
      <div id="myDiv"><!-- Plotly chart will be drawn inside this DIV --></div>
      <script src="{$WWW_JS}style.js"></script>
    </body>
</html>