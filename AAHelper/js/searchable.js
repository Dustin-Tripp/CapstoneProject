$(function () {
    $( '#studentList' ).searchable({
        striped: false,
        oddRow: { 'background-color': '#f5f5f5' },
        evenRow: { 'background-color': '#fff' },
        searchType: 'fuzzy'
    });
});