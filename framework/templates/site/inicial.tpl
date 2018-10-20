<html>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <!-- Plotly.js -->
      <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
      <!-- Select2 -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
      <!-- Bootstrap -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

      <!-- Style -->
        <link rel="stylesheet" href="{$WWW_CSS}style.css">
    </head>

    <body>
        <div class="navbar">
            <div class="form-group">
                <label>Pokemon 1</label>
                <select id="pokemon1" name="pokemon1" class="form-control">
                    {foreach $arrObjPokemon as $oPokemon}
                        <option value="{$oPokemon->iCodigo}">{$oPokemon->sName}</option>
                    {/foreach}
                </select>
            </div>

            <div class="form-group">
                <label>Pokemon 2</label>
                <select id="pokemon2" name="pokemon2" class="form-control">
                    {foreach $arrObjPokemon as $oPokemon}
                        <option value="{$oPokemon->iCodigo}">{$oPokemon->sName}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="container-fluid pokemon-status row">
            <div id="pokemon1-status" class="col-xs-4 pokemon-status"></div>    
            <div id="myDiv"><!-- Plotly chart will be drawn inside this DIV --></div>
            <div id="pokemon2-status" class="col-xs-4 pokemon-status"></div>
        </div>
        
        <script src="{$WWW_JS}style.js"></script>
    </body>
</html>