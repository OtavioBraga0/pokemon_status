function carregaGrafico(){
    data = [
      {
      type: 'scatterpolar',
      r: [45,49,49,65,65,45],
      theta: ['HP','Attack','Defense','Special Atk','Special Defense','Speed'],
      fill: 'toself',
      name: 'Bulbasaur'
      },
      {
      type: 'scatterpolar',
      r: [39,52,43,60,50,65],
      theta: ['HP','Attack','Defense','Special Atk','Special Defense','Speed'],
      fill: 'toself',
      name: 'Charmander'
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

    Plotly.plot("myDiv", data, layout)
}

$("#comparar").click(function(){
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
    })
})

