accounting = require 'accounting'
Roulette   = require './src/roulette'

class Aaron
  constructor: ->
    @roulette = new Roulette()
    @moneys  = 1
    @winnings = 1

  play: =>
    if @winnings > 0
      newBet = @winnings
    else
      newBet = Math.abs @winnings * 2

    winnings = @roulette.bet @moneys, on: 'black'
    moneys += winnings


aaron = new Aaron()
while true
  aaron.play()
  console.log 'moneys: ', accounting.formatMoney(aaron.moneys)
