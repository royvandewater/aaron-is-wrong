_ = require 'lodash'

class Roulette
  constructor: (dependencies={}) ->
    @pockets = @createPockets()
    @sample = dependencies.sample ? _.sample

  bet: (amount=0, kwargs={}) =>
    color = kwargs.on
    if color == @sample @pockets
      amount
    else
      -amount

  createPockets: =>
    reds   = _.times 18, => 'red'
    blacks = _.times 18, => 'black'
    greens = _.times 2,  => 'green'
    [].concat reds, blacks, greens

module.exports = Roulette
