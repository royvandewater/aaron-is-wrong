SimpleRoulette = require 'simple-roulette'

class Aaron
  constructor: (dependencies={}) ->
    @roulette = dependencies.roulette ? new SimpleRoulette
    @money = 1
    @winnings = 1

  amount: =>
    return 1 if @money > 0
    return @money * -2 if @money < 0
    return 1

  play: =>
    @winnings = @roulette.bet @amount(), on: 'black'
    @money += @winnings

module.exports = Aaron
