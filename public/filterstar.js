function filterStarByConstell() {
    //get the id of the selected homeworld from the filter dropdown
    var constell_id = document.getElementById('constell_filter').value
    //construct the URL and redirect to it
    window.location = '/Stars/filter/' + parseInt(homeworld_id)
}
