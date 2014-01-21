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
    iDisplayLength: 15
    aoColumnDefs: [
      aDataSort: [0]
      aTargets: [0],
      aDataSort:[1]
      aTargets: [1],
      aDataSort:[2,1]
      aTargets: [2],
      aDataSort:[3]
      aTargets: [3],
      aDataSort:[4]
      aTargets: [4],
      aDataSort:[5,6]
      aTargets: [5],
      aDataSort:[6,5]
      aTargets: [6],
      bSortable: false
      aTargets: [7,8]
    ]