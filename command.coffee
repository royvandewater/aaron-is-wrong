{formatMoney} = require 'accounting'
_     = require 'lodash'
Aaron = require './src/aaron'

class Command
  constructor:  ->
    @f = formatMoney
    @aaron = new Aaron()
    @turn = 0

  run: =>
    @turn += 1
    @aaron.play()
    console.log "#{@turn}: #{@f(@aaron.moneys)}"

    _.delay @run, 500

(new Command()).run()
