jQuery ->
  if $('body.visas').length > 0
    $('#visas').dataTable
      sDom: "<\"alert-notice\" r><\"top\" f><\"bottom\"tilp><\"clear\">"
      sPaginationType: "bootstrap"
      bJQueryUI: false
      bProcessing: true
      bServerSide: true
      sAjaxSource: $('#visas').data('source')
      iDisplayLength: 15
      aoColumnDefs: [
        aDataSort: [2]
        aTargets: [2],
        bSortable: false
        aTargets: [0,1,3,4,5,6]
      ]