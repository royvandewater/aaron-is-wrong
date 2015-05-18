_ = require 'lodash'

class Roulette
  constructor: (dependencies={}) ->
    @pockets = @createPockets()
    @sample = dependencies.sample ? _.sample

  bet: (amount=0, kwargs={}) =>
    throw new Error('Negative bets are invalid') if amount < 0
    throw new Error('Bet cannot be 0') if amount == 0
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
