_ = require 'lodash'

class Roulette
  constructor: =>
    @pockets = @generatePockets()

  generatePockets: =>
    reds   = _.times 18, => 'red'
    blacks = _.times 18, => 'black'
    greens = _.times 2,  => 'green'
    [].concat reds, blacks, greens

  run: (bet, options={}) =>
    betColor = options.on
    color = _.sample @pockets

    if betColor == color then bet else -bet

module.exports = Roulette
