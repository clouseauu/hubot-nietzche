chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hubot-nietzche', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/hubot-nietzche')(@robot)

  it 'registers a respond listener for a single quote', ->
    expect(@robot.respond).to.have.been.calledWith(/nietzche me$/i)

  it 'registers a respond listener for multiple quotes', ->
    expect(@robot.respond).to.have.been.calledWith(/nietzche me\s{1}(\d+)?$/i)
