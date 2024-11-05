async     = require 'async'
_         = require 'lodash'
f         = require('accounting').formatMoney
LimitGame = require './src/limit-game'

BATCH_SIZE = 10000

class Command
  constructor:  (@numGames, @lowerLimit, @upperLimit) ->
    @winnings = -1 * @numGames
    @quitBecauseLowerLimit = 0

  run: =>
    _.times @numGames, =>
      game = new LimitGame(@lowerLimit, @upperLimit)
      result = game.play()
      @winnings += result
      @quitBecauseLowerLimit += 1 if result < 0

    console.log 'total winnings: ', f(@winnings)
    console.log 'Average winnings: ', f(@winnings / @numGames)
    console.log 'Number of quit because Aaron hit the lower limit: ', @quitBecauseLowerLimit
    console.log 'Percentage of games won: ', 100 - (@quitBecauseLowerLimit / @numGames) * 100

numGames = parseInt process.argv[2] ? 100
lowerLimit    = parseInt process.argv[3] ? -256
upperLimit    = parseInt process.argv[4] ? 2
(new Command(numGames, lowerLimit, upperLimit)).run()
