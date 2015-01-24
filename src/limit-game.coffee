_     = require 'lodash'
Aaron = require './aaron'

class LimitGame
  constructor: (@limit=1024) ->
    @aaron = new Aaron

  play: =>
    while Math.abs(@aaron.money) < @limit
      @aaron.play()

    @aaron.money

module.exports = LimitGame
