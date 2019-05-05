$(document).on('turbolinks:load', function(){
  let recommended = $('ul#recommended');
  let movies = [];

  $.ajax({
    type: "GET",
    url: "http://localhost:3000/recommended",
    success: function(response){
      console.log(response);
        $.each(response, function(index, movie) {
          movies.push('<li class="list-group-item" value="'+movie.id+'">'+ movie.title +'</li>')
          recommended.html(movies.join(''));
        })
    }
  });
});
