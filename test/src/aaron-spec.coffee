Aaron = require '../../src/aaron'

describe 'Aaron', ->
  describe 'a new Aaron', ->
    beforeEach ->
      @sut = new Aaron

    it 'should be instantiable', ->
      expect(@sut).to.exist

    it 'should have a money of 1', ->
      expect(@sut.money).to.equal 1

    it 'should have winnings of 1', ->
      expect(@sut.winnings).to.equal 1

  describe '->play', ->
    beforeEach ->
      @roulette = bet: sinon.stub().returns 0
      @sut = new Aaron roulette: @roulette

    it 'should bet 1 on black', ->
      @sut.play()
      expect(@roulette.bet).to.have.been.calledWith 1, on: 'black'

    describe 'when it loses', ->
      beforeEach ->
        @roulette.bet.returns -1
        @sut.play()

      it 'should subtract 1 from its money', ->
        expect(@sut.money).to.equal 0

      it 'should track -1 as its winnings', ->
        expect(@sut.winnings).to.equal -1

    describe 'when it wins', ->
      beforeEach ->
        @roulette.bet.returns 1
        @sut.play()

      it 'should add 1 to its money', ->
        expect(@sut.money).to.equal 2

      it 'should track 1 as its winnings', ->
        expect(@sut.winnings).to.equal 1

    describe 'when it lost last time', ->
      beforeEach ->
        @sut.money = 0
        @sut.winnings = -1

      it 'should try to regain its losses', ->
        @sut.play()
        expect(@roulette.bet).to.have.been.calledWith 2, on: 'black'








