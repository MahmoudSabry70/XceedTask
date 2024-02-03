$(document).ready(function () {
    $('product-list').DataTable();
    // Basic table example
});

$(document).ready(function () {
    var tableData = $('#basic-1').DataTable({
        paging: true,
        ordering: true,
        dom: 'lBfrtip',
        dom: "<'row'<'col-sm-3'l><'col-sm-6'B><'col-sm-3'f>>" + "<'row'<'table-responsive't>>" + "<'row'<'col-sm-6'i><'col-sm-6'p>>",
        processing: true,
        lengthChange: true,
        autoWidth: true,
        deferRender: true,
        "pagingType": "simple_numbers",
        "lengthMenu": [50, 75, 100, 150],
    });
});