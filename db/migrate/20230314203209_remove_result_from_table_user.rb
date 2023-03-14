class RemoveResultFromTableUser < ActiveRecord::Migration[7.0]
  def up
    remove_column :users, :result
  end

  def down
    add_column :users, :result
  end

end
