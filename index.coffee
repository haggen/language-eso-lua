fuzzy = require('fuzzy')
tokens = require('./tokens.json')

provider =
  selector: '.source.eso-lua'
  getSuggestions: (options) ->
    new Promise (resolve) ->
      query = fuzzy.filter(options.prefix, tokens)
      resolve query.map (item) ->
        { text: item.string, type: 'constant' }

module.exports =
  provider: -> provider
