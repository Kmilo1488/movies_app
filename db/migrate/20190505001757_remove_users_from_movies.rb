class RemoveUsersFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :users_id, :bigint
  end
end
