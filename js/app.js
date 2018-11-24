 var nodes;
 var edges;
 
$.post(
    URL + 'faculdade/pokemon_status/montaGrafo',
    {
        bGrafo: 'true'
    }
).done(function(arrObjPokemon){
    console.log(arrObjPokemon);
    
    // create an array with nodes
    nodes = new vis.DataSet(JSON.parse(arrObjPokemon));
    // create an array with edges
    edges = new vis.DataSet([
        {from: 1, to: 3},
        {from: 1, to: 2},
        {from: 2, to: 4},
        {from: 2, to: 5}
    ]);

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
        }
    };
    var network = new vis.Network(container, data, options);
})

  

// '<img src="https://img.pokemondb.net/sprites/omega-ruby-alpha-sapphire/dex/normal/'.strtolower($mArrDados[$a]['Pokemon_vch_Name']).'.png" />'