jQuery ->
  $(document).ready ->
    if $('body.employees').length > 0
      $('#employees').dataTable
        sDom: "<rp><\"top\" f><\"bottom\"tilp><\"clear\">"
        sPaginationType: "bootstrap"
        bJQueryUI: false
        bProcessing: true
        bServerSide: true
        sAjaxSource: $('#employees').data('source')
        iDisplayLength: 10
        aoColumnDefs: [
          aDataSort: [0]
          aTargets: [0],
          aDataSort: [1]
          aTargets: [1],
          aDataSort: [2, 1]
          aTargets: [2],
          aDataSort: [3]
          aTargets: [3],
          aDataSort: [4]
          aTargets: [4],
          aDataSort: [5, 6]
          aTargets: [5],
          aDataSort: [6, 5]
          aTargets: [6],
          bSortable: false
          aTargets: [7, 8]
          ]
        fnDrawCallback: startTableClicker



