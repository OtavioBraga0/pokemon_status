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

        var pokemon_status = ` <div class="row compare-pokemon">
                                    <label class='text-center'>${arrObjPokemon[0].sName}</label>
                                    <input type='hidden' class="idPokemon" value="${arrObjPokemon[0].iCodigo}" />
                                    <div class="col-xs-12">
                                        <img class="img-responsive img-pokemon" src="https://img.pokemondb.net/artwork/${arrObjPokemon[0].sName.toLowerCase()}.jpg">
                                    </div>
                                    <div class="pokemon-type">
                                        ${arrObjPokemon[0].sType1 != "" ? '<img class="img-responsive img-atribute" src="https://veekun.com/dex/media/types/en/'+ arrObjPokemon[0].sType1.toLowerCase() +'.png"></img>':""}
                                        ${arrObjPokemon[0].sType2 != "" ? '<img class="img-responsive img-atribute" src="https://veekun.com/dex/media/types/en/'+ arrObjPokemon[0].sType2.toLowerCase() +'.png"></img>':""}
                                    </div>
                                    <div class="jumbotron">
                                        <table class="table table-striped">
                                            <tr><td>HP: <b>${arrObjPokemon[0].iHp}</b></td></tr>                                        
                                            <tr><td>Attack: <b>${arrObjPokemon[0].iAttack}</b></td></tr>
                                            <tr><td>Defense: <b>${arrObjPokemon[0].iDefense}</b></td></tr>                                        
                                            <tr><td>Sp. Attack: <b>${arrObjPokemon[0].iSpAttack}</b></td></tr>
                                            <tr><td>Sp. Defense: <b>${arrObjPokemon[0].iSpDefense}</b></td></tr>                                        
                                            <tr><td>Speed: <b>${arrObjPokemon[0].iSpeed}</b></td></tr>
                                        </table>
                                    </div>
                                </div>`

        if(posicao == 'left'){
            $("#pokemon1-status").html(pokemon_status);     
            
            Plotly.deleteTraces("myDiv", 0)       
            Plotly.addTraces("myDiv", data, 0)       
        } else {        
            $("#pokemon2-status").html(pokemon_status);

            Plotly.deleteTraces("myDiv", 1)
            Plotly.addTraces("myDiv", data, 1)
        }
    })

    setTimeout(function(){
        comparaPokemon()
        validaPokemon();
    }, 200)
}

function comparaPokemon(){
    let pokemon1 = $("#pokemon1-status b");
    let pokemon2 = $("#pokemon2-status b");

    $(pokemon1).attr("class", "");
    $(pokemon2).attr("class", "");

    for(let i = 0; i < 6; i++){
        console.log($(pokemon1[i]).text() + " - " + $(pokemon2[i]).text());
        if(parseInt($(pokemon1[i]).text()) < parseInt($(pokemon2[i]).text())){
            $(pokemon1[i]).addClass("text-danger alert-danger");
            $(pokemon2[i]).addClass("text-success alert-success");
        } else if(parseInt($(pokemon1[i]).text()) > parseInt($(pokemon2[i]).text())){
            $(pokemon1[i]).addClass("text-success alert-success");
            $(pokemon2[i]).addClass("text-danger alert-danger");    
        } else {
            $(pokemon1[i]).attr("class", "");
            $(pokemon2[i]).attr("class", "");   
        }
    }
}

function validaPokemon(){
    let pokemon1 = $("#pokemon1-status label").text();
    let pokemon2 = $("#pokemon2-status label").text();

    if((pokemon1 != "") && (pokemon2 != "")){
        $("#luta-pokemon").show();
    } else {
        $("#luta-pokemon").hide();
    }
}

$("#pokemon1").change(function(){
    buscaPokemon($(this).val(), 'left');
})

$("#pokemon2").change(function(){
    buscaPokemon($(this).val(), 'right');
})

$("#luta-pokemon").click(function(){
    let idPokemon = $(".idPokemon");

    let idPokemon1 = $(idPokemon[0]).val();
    let idPokemon2 = $(idPokemon[1]).val();

    $.post(
        "http://localhost/faculdade/pokemon_status/",
        {
            idPokemon1 = idPokemon1, 
            idPokemon2 = idPokemon2 
        }
    ).done(function(arrObjCombats){
        
    })
});

$(document).ready(function(){
  $("#pokemon1").select2();  
  $("#pokemon2").select2();  

  $("#luta-pokemon").hide();

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