_ = require 'lodash'
Roulette = require '../../src/roulette'

describe 'Roulette', ->
  describe 'the pockets', ->
    beforeEach ->
      @sut = new Roulette

    it 'should have 38 pockets', ->
      expect(@sut.pockets).to.have.a.lengthOf 38

    it 'should have 18 reds', ->
      reds = _.filter @sut.pockets, (pocket) => pocket == 'red'
      expect(reds).to.have.a.lengthOf 18

    it 'should have 18 blacks', ->
      blacks = _.filter @sut.pockets, (pocket) => pocket == 'black'
      expect(blacks).to.have.a.lengthOf 18

    it 'should have 2 greens', ->
      greens = _.filter @sut.pockets, (pocket) => pocket == 'green'
      expect(greens).to.have.a.lengthOf 2

  describe '->bet', ->
    beforeEach ->
      @sample = sinon.stub()
      @sut = new Roulette sample: @sample

    describe 'when bet is called with nothing', ->
      beforeEach ->
        @result = @sut.bet()

      it 'should return 0', ->
        expect(@result).to.equal 0

    describe 'when sample returns red', ->
      beforeEach ->
        @sample.returns 'red'

      describe 'when bet is called with 1 on red', ->
        beforeEach ->
          @result = @sut.bet 1, on: 'red'

        it 'should return 1', ->
          expect(@result).to.equal 1

        it 'should have called sample with its pockets', ->
          expect(@sample).to.have.been.calledWith @sut.pockets

      describe 'when bet is called with 1 on black', ->
        beforeEach ->
          @result = @sut.bet 1, on: 'black'

        it 'should return -1', ->
          expect(@result).to.equal -1

    describe 'when sample returns black', ->
      beforeEach ->
        @sample.returns 'black'

      describe 'when bet is called with 1 on red', ->
        beforeEach ->
          @result = @sut.bet 1, on: 'red'

        it 'should return -1', ->
          expect(@result).to.equal -1

      describe 'when bet is called with 1 on black', ->
        beforeEach ->
          @result = @sut.bet 1, on: 'black'

        it 'should return 1', ->
          expect(@result).to.equal 1

  describe '->bet statistics', ->
    describe 'when bet is called 100000 times with 1 on red', ->
      beforeEach ->
        @sut = new Roulette
        @results = _.times 100000, => @sut.bet 1, on: 'red'

      # 100000 * 18/38 = 47368
      it 'should be positive ~47368 times', ->
        expect(@sut).to.exist
        positives = _.filter @results, (result) => result > 0
        expect(_.size positives).to.be.closeTo 47368, 1000



