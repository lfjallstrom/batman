#= require ../../set/set_index

class Batman.PolymorphicAssociationSetIndex extends Batman.SetIndex
  constructor: (@association, @type, key) ->
    super @association.getRelatedModel().get('loaded'), key

  _resultSetForKey: (key) ->
    @_storage.getOrSet key, =>
      new @association.proxyClass(key, @type, @association)
