class EditMovies < ActiveRecord::Migration
  def change
  	remove_column :movies, :description
  	add_column :movies, :review, :text
  	remove_column :movies, :poster_image_url
  end
end
