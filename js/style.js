function buscaPokemon(){
    var pokemon1 = $("#pokemon1").val()
    var pokemon2 = $("#pokemon2").val()
    
    $.post(
        "http://localhost:81/pokemon_status/",
        {
            idPokemon1: pokemon1, 
            idPokemon2: pokemon2
        }
    ).done(function(arrObjPokemon){
        $("#myDiv").html();
        arrObjPokemon = JSON.parse(arrObjPokemon);
        data = [
          {
              type: 'scatterpolar',
              r: [
                  arrObjPokemon[0].iHp,
                  arrObjPokemon[0].iAttack,
                  arrObjPokemon[0].iDefense,
                  arrObjPokemon[0].iSpAttack,
                  arrObjPokemon[0].iSpDefense,
                  arrObjPokemon[0].iSpeed
              ],
              theta: ['HP','Attack','Defense','Special Atk','Special Defense','Speed'],
              fill: 'toself',
              name: arrObjPokemon[0].sName
          },
          {
              type: 'scatterpolar',
              r: [
                  arrObjPokemon[1].iHp,
                  arrObjPokemon[1].iAttack,
                  arrObjPokemon[1].iDefense,
                  arrObjPokemon[1].iSpAttack,
                  arrObjPokemon[1].iSpDefense,
                  arrObjPokemon[1].iSpeed
              ],
              theta: ['HP','Attack','Defense','Special Atk','Special Defense','Speed'],
              fill: 'toself',
              name: arrObjPokemon[1].sName
          }
        ]

        layout = {
          polar: {
            radialaxis: {
              visible: true,
              range: [0, 300]
            }
          }
        }

        Plotly.newPlot("myDiv", data, layout)
        
        var pokemon1_status = ` <div class="col-xs-12">
                                    <img class="img-responsive" src="https://img.pokemondb.net/artwork/${arrObjPokemon[0].sName.toLowerCase()}.jpg">
                                </div>
                                <div class="container-fluid">
                                    <ul>
                                        <li>${arrObjPokemon[0].iHp}</li>                                        
                                        <li>${arrObjPokemon[0].iAttack}</li>
                                        <li>${arrObjPokemon[0].iDefense}</li>                                        
                                        <li>${arrObjPokemon[0].iSpAttack}</li>
                                        <li>${arrObjPokemon[0].iSpDefense}</li>                                        
                                        <li>${arrObjPokemon[0].iSpeed}</li>
                                    </ul>
                                </div>`        
        var pokemon2_status = ` <div class="col-xs-12">
                                    <img class="img-responsive" src="https://img.pokemondb.net/artwork/${arrObjPokemon[1].sName.toLowerCase()}.jpg">
                                </div>
                                <div class="container-fluid">
                                    <ul>
                                        <li>${arrObjPokemon[1].iHp}</li>                                        
                                        <li>${arrObjPokemon[1].iAttack}</li>
                                        <li>${arrObjPokemon[1].iDefense}</li>                                        
                                        <li>${arrObjPokemon[1].iSpAttack}</li>
                                        <li>${arrObjPokemon[1].iSpDefense}</li>                                        
                                        <li>${arrObjPokemon[1].iSpeed}</li>
                                    </ul>
                                </div>`  
        
        $("#pokemon1-status").html(pokemon1_status);        
        $("#pokemon2-status").html(pokemon2_status);

    })
}

$("#pokemon1").change(function(){
    buscaPokemon();
})

$("#pokemon2").change(function(){
    buscaPokemon();
})

$(document).ready(function(){
  $("#pokemon1").select2();  
  $("#pokemon2").select2();  
})