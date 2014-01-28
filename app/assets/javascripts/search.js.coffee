# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
setSuggestions = (array) ->
    availableTags = array
    $("#visa_type_tags").autocomplete source: availableTags