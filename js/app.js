 var nodes;
 var edges;
 
$.post(
    URL + 'faculdade/pokemon_status',
    {
        bGrafo: 'true'
    }
).done(function(arrObjPokemon){
    console.log(arrObjPokemon);
    
    // create an array with nodes
    nodes = new vis.DataSet(arrObjPokemon);
})

  // create an array with edges
  edges = new vis.DataSet([
    {from: 1, to: 3},
  ]);

  // create a network
  var container = document.querySelector("#mynetwork");
  var data = {
    nodes: nodes,
    edges: edges
  };
  var options = {};
  var network = new vis.Network(container, data, options);