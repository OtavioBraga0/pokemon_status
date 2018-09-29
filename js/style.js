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