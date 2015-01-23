async     = require 'async'
_         = require 'lodash'
LimitGame = require './src/limit-game'

BATCH_SIZE = 10000

class Command
  constructor:  (@numGames=100, @limit=1000) ->
    @wins   = 0
    @losses = 0

  batch: (i, cb=->) =>
    numGamesLeft = @numGames - (BATCH_SIZE * i)

    batchSize = if numGamesLeft > BATCH_SIZE then BATCH_SIZE else numGamesLeft

    async.times batchSize, @playLimitGame, (error, results) =>
      _.each results, (result) =>
        if result.win then @wins++ else @losses++
      console.log "batch #{i} done", @formatResults()
      cb()

  run: =>
    numBatches = Math.ceil @numGames / BATCH_SIZE
    console.log "#{numBatches} batches"
    async.timesSeries numBatches, @batch, (error) =>
      console.log 'all done', @formatResults()

  playLimitGame: (i, done) =>
    new LimitGame(@limit).play done

  formatResults: => "wins: #{@wins}, losses: #{@losses}"

(new Command(process.argv[2], process.argv[3])).run()
