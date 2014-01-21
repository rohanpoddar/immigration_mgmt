# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).on "focus", "[data-behaviour~='datepicker']", (e) ->
- $(this).datepicker
- format: "dd-mm-yyyy"
- weekStart: 1
- autoclose: true

jQuery ->
  $('#employees').dataTable
    sPaginationType: "bootstrap"
    bJQueryUI: false
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#employees').data('source')