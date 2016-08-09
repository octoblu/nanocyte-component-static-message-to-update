{beforeEach, describe, it} = global
{expect} = require 'chai'

ReturnValue = require 'nanocyte-component-return-value'
StaticMessageToUpdate = require '../src/static-message-to-update'

describe 'StaticMessageToUpdate', ->
  beforeEach ->
    @sut = new StaticMessageToUpdate

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with useStaticMessage true', ->
      beforeEach ->
        @envelope =
          message: 'anything'
          config:
            staticMessage: 'whatever'
            useStaticMessage: true

      it 'should return the staticMessage, wrapped in $set', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal $set: 'whatever'

    describe 'when called with useStaticMessage false', ->
      beforeEach ->
        @envelope =
          message: 'anything'
          config:
            staticMessage: 'whatever'
            useStaticMessage: false

      it 'should return the message', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal 'anything'
