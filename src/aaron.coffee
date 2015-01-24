Roulette = require './roulette'

class Aaron
  constructor: (dependencies={}) ->
    @roulette = dependencies.roulette ? new Roulette
    @money = 1
    @winnings = 1

  amount: =>
    return @money if @winnings > 0
    -2 * @winnings

  play: =>
    @winnings = @roulette.bet @amount(), on: 'black'
    @money += @winnings

module.exports = Aaron
