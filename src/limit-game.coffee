f     = require('accounting').formatMoney
_     = require 'lodash'
Aaron = require './aaron'

class LimitGame
  constructor: (@limit=1000) ->
    @aaron = new Aaron
    @turn = 0

  play: (callback=->) =>
    @turn += 1
    @aaron.play()
    # console.log "#{@turn}: #{f(@aaron.moneys)}"

    if Math.abs(@aaron.moneys) > @limit
      won = @aaron.moneys > 0
      return callback null, win: won

    _.delay @play, 0, callback

module.exports = LimitGame
