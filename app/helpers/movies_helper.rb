module MoviesHelper

  def title_form_movie
    @movie.new_record? ? 'Crear Pelicula' : 'Editar Pelicula'
  end
end
