jQuery ->
  $(document).ready ->
    if $('body.visas').length > 0
      $('#visas').dataTable
        sDom: "<\"alert-notice\" rp><\"top\" f><\"bottom\"tilp><\"clear\">"
        sPaginationType: "bootstrap"
        bJQueryUI: false
        bProcessing: true
        bServerSide: true
        sAjaxSource: $('#visas').data('source')
        iDisplayLength: 10
        aoColumnDefs: [
          aDataSort: [3]
          aTargets: [3],
          aDataSort: [4]
          aTargets: [4],
          aDataSort: [5]
          aTargets: [5],
          aSort: [6]
          aTargets: [6],
          bSortable: false
          aTargets: [0, 1, 2, 7, 8]
        ]