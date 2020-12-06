function updateStars(id){
    $.ajax({
        url: '/Stars/' + id,
        type: 'PUT',
        data: $('#update-stars').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};
