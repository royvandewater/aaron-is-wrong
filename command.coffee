async     = require 'async'
_         = require 'lodash'
f         = require('accounting').formatMoney
LimitGame = require './src/limit-game'

BATCH_SIZE = 10000

class Command
  constructor:  (@numGames=100, @limit=1024) ->
    @winnings = -1 * @numGames

  run: =>
    _.times @numGames, =>
      @winnings += new LimitGame(@limit).play()

    console.log 'total winnings: ', f(@winnings)

numGames = parseInt process.argv[2]
limit = parseInt process.argv[3]
(new Command(numGames, limit)).run()
