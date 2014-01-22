jQuery ->
  if $('body.passports').length > 0
    $('#passports').dataTable
      sDom: "<\"alert-notice\" r><\"top\" f><\"bottom\"tilp><\"clear\">"
      sPaginationType: "bootstrap"
      bJQueryUI: false
      bProcessing: true
      bServerSide: true
      sAjaxSource: $('#passports').data('source')
      iDisplayLength: 15
      aoColumnDefs: [
        aDataSort: [0]
        aTargets: [0],
        bSortable: false
        aTargets: [1,2,3,4,5,6,7]
      ]