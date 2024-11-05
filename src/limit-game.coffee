_     = require 'lodash'
Aaron = require './aaron'

class LimitGame
  constructor: (@lowerLimit=-256, @upperLimit=2) ->
    @aaron = new Aaron

  play: =>
    while @aaron.money > @lowerLimit and @aaron.money < @upperLimit
      @aaron.play()

    @aaron.money

module.exports = LimitGame
