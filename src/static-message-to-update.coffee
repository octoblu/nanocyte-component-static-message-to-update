ReturnValue = require 'nanocyte-component-return-value'

class StaticMessageToUpdate extends ReturnValue
  onEnvelope: (envelope) =>
    {config, message} = envelope

    return $set: config.staticMessage if config.useStaticMessage
    message

module.exports = StaticMessageToUpdate
