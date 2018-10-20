function buscaPokemon(idPokemon, posicao){
    $.post(
        "http://localhost/faculdade/pokemon_status/",
        {
            idPokemon: idPokemon
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
          }
        ]
        if(posicao == 'left'){
            var pokemon1_status = ` <div class="row">
                                        <div class="col-xs-12">
                                            <img class="img-responsive img-pokemon" src="https://img.pokemondb.net/artwork/${arrObjPokemon[0].sName.toLowerCase()}.jpg">
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
                                        </div>
                                    </div>`   
            $("#pokemon1-status").html(pokemon1_status);     
            
            Plotly.deleteTraces("myDiv", 0)       
            Plotly.addTraces("myDiv", data, 0)       
        } else {
            var pokemon2_status = ` <div class="row">
                                    <div class="col-xs-12">
                                        <img class="img-responsive img-pokemon" src="https://img.pokemondb.net/artwork/${arrObjPokemon[0].sName.toLowerCase()}.jpg">
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
                                    </div>
                                </div>`  
        
            $("#pokemon2-status").html(pokemon2_status);

            Plotly.deleteTraces("myDiv", 1)
            Plotly.addTraces("myDiv", data, 1)
        }
    })
}

$("#pokemon1").change(function(){
    buscaPokemon($(this).val(), 'left');
})

$("#pokemon2").change(function(){
    buscaPokemon($(this).val(), 'right');
})

$(document).ready(function(){
  $("#pokemon1").select2();  
  $("#pokemon2").select2();  

  data = [
    {
        type: 'scatterpolar',
        r: [],
        theta: ['HP','Attack','Defense','Special Atk','Special Defense','Speed'],
        fill: 'toself'
    },
    {
        type: 'scatterpolar',
        r: [],
        theta: ['HP','Attack','Defense','Special Atk','Special Defense','Speed'],
        fill: 'toself'
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

  Plotly.newPlot("myDiv", data, layout, {displayModeBar: false})
})