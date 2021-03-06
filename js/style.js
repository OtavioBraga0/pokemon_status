function buscaPokemon(idPokemon, posicao){
    $.post(
        URL + "faculdade/pokemon_status/",
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
                                        <img class="img-responsive img-pokemon" src="https://img.pokemondb.net/artwork/${arrObjPokemon[0].sImage}.jpg">
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
        // console.log($(pokemon1[i]).text() + " - " + $(pokemon2[i]).text());
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

    if(pokemon1 != ""){
        $(".luta-pokemon1").show();
    } else {
        $(".luta-pokemon1").hide();        
    } 
    
    if(pokemon2 != ""){
        $(".luta-pokemon2").show();
    } else {
        $(".luta-pokemon2").hide();
    }
}

function montaGrafo(idPokemon){
    var nodes;
    var edges;
    
    $.post(
        URL + 'faculdade/pokemon_status/montaGrafo',
        {
            idPokemon: idPokemon 
        }
    ).done(function(arrObjDados){
        arrObjDados = JSON.parse(arrObjDados)
        
        nodes = eliminaRepeticao(ordenaJson(arrObjDados.nodes), 'id')
        edges = eliminaRepeticao(arrObjDados.edges, 'to')        

        // create an array with nodes
        nodes = new vis.DataSet(nodes);
        // create an array with edges
        edges = new vis.DataSet(edges);

        // create a network
        var container = document.querySelector("#mynetwork");
        var data = {
            nodes: nodes,
            edges: edges
        };
        var options = { 
            edges: {
                arrows: {
                    to:     {enabled: true, scaleFactor:1, type:'arrow'},
                    middle: {enabled: false, scaleFactor:1, type:'arrow'},
                    from:   {enabled: false, scaleFactor:1, type:'arrow'}
                }
            },
        };
        var network = new vis.Network(container, data, options);
    })

    $("#modal-grafo").modal('show');
}


function ordenaJson(lista) {
    return lista.sort(function(a, b) {
        return a.id - b.id;
    });
}

function eliminaRepeticao(arr, prop) {
    var novoArray = [];
    var lookup  = {};

    for (var i in arr) {
        lookup[arr[i][prop]] = arr[i];
    }

    for (i in lookup) {
        novoArray.push(lookup[i]);
    }

    return novoArray;
}

$("#pokemon1").change(function(){
    buscaPokemon($(this).val(), 'left');
})

$("#pokemon2").change(function(){
    buscaPokemon($(this).val(), 'right');
})

$(".luta-pokemon1").click(function(){
    let idPokemon = $(".idPokemon");

    let idPokemon1 = $(idPokemon[0]).val();

    montaGrafo(idPokemon1);
});

$(".luta-pokemon2").click(function(){
    let idPokemon = $(".idPokemon");

    let idPokemon2 = $(idPokemon[1]).val();

    montaGrafo(idPokemon2);
});

$(document).ready(function(){
  $("#pokemon1").select2();  
  $("#pokemon2").select2();  

  $(".luta-pokemon1").hide();
  $(".luta-pokemon2").hide();  

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