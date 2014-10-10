class AddReviewOrWishToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :watched, :boolean
  end
end
