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

      <!-- VIS -->
      <link rel="stylesheet" href="{$WWW_CSS}vis.min.css">

      <!-- Style -->
        <link rel="stylesheet" href="{$WWW_CSS}style.css">
    </head>

    <body>
        <div class="navbar">
            <div class="col-xs-3">
                <div class="form-group">
                    <label>Pokemon 1</label>
                    <select id="pokemon1" name="pokemon1" class="form-control">
                        {foreach $arrObjPokemon as $oPokemon}
                            <option value="{$oPokemon->iCodigo}">{$oPokemon->sName}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="col-xs-6" id="pokemon-logo">
                <img class="pokemon-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/640px-International_Pok%C3%A9mon_logo.svg.png"/>
            </div>
            <div class="col-xs-3">
                <div class="form-group">
                    <label>Pokemon 2</label>
                    <select id="pokemon2" name="pokemon2" class="form-control">
                        {foreach $arrObjPokemon as $oPokemon}
                            <option value="{$oPokemon->iCodigo}">{$oPokemon->sName}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
        </div>
        <div class="container-fluid pokemon-status">
            <div id="pokemon1-status" class="col-xs-2 pokemon-status"></div>    
            <div id="myDiv"><!-- Plotly chart will be drawn inside this DIV --></div>
            <div id="pokemon2-status" class="col-xs-2 pokemon-status"></div>
        </div>
        <div class="row luta-menu">
            <div class="col-xs-3">
                <img class="luta-pokemon1" src="https://png2.kisspng.com/20180729/ueg/kisspng-computer-icons-battle-clash-of-clans-shield-logo-5b5d3f09c880d6.1588008015328376418213.png" />
            </div>
            <div class="col-xs-6">
                <!-- <img id="luta-pokemon" src="https://png2.kisspng.com/20180729/ueg/kisspng-computer-icons-battle-clash-of-clans-shield-logo-5b5d3f09c880d6.1588008015328376418213.png" /> -->
            </div>
            <div class="col-xs-3">
                <img class="luta-pokemon2" src="https://png2.kisspng.com/20180729/ueg/kisspng-computer-icons-battle-clash-of-clans-shield-logo-5b5d3f09c880d6.1588008015328376418213.png" />
            </div>
        </div>

        <div class="modal fade" id="modal-grafo" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title">Vitórias</h4>
                </div>
                <div class="modal-body">
                    <div id="mynetwork"></div>
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
          </div><!-- /.modal -->

        <script>
            var URL = "http://localhost/";
        </script>
        <script src="{$WWW_JS}style.js"></script>
        <script src="{$WWW_JS}vis.js"></script>
        <script src="{$WWW_JS}app.js"></script>
    </body>
</html>