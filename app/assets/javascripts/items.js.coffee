# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

clientSideValidations.formBuilders["FormtasticBootstrap::FormBuilder"] =
  add: (element, settings, message) ->
    if element.data("valid") isnt false
      element.addClass("error").data "valid", false
      $parent = element.closest(".input")
      $parent.parent().addClass "error"
      $("<span/>").addClass("help-inline").text(message).appendTo $parent
    else
      element.parent().find("span.help-inline").text message

  remove: (element, settings) ->
    $parent = element.closest(".input")
    $parent.parent().removeClass "error"
    $parent.find("span.help-inline").remove()
    element.removeClass "error"