Roulette   = require './roulette'

class Aaron
  constructor: ->
    @roulette = new Roulette()
    @moneys   = 1
    @winnings = 1
    @newBet   = 0

  play: =>
    if @winnings > 0
      @bet = @moneys
    else
      @bet = Math.abs @winnings * 2

    @winnings = @roulette.bet @bet, on: 'black'
    @moneys += @winnings

module.exports = Aaron
