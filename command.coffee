async     = require 'async'
_         = require 'lodash'
LimitGame = require './src/limit-game'

class Command
  constructor:  (@numGames=100, @limit=1000) ->

  run: =>
    games = _.times @numGames, => @playLimitGame
    async.series games, (error, results) =>
      wins   = 0
      losses = 0

      _.each results, (result) =>
        if result.win then wins += 1 else losses += 1

      console.log "wins: #{wins}, losses: #{losses}"

  playLimitGame: (done) =>
    new LimitGame(@limit).play done

(new Command(process.argv[2], process.argv[3])).run()
