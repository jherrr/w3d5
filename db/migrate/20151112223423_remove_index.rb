class RemoveIndex < ActiveRecord::Migration
  def change
    remove_index(:users, name: :index_users_on_fname_and_lname)
  end
end
