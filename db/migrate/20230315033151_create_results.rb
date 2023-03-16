class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :user, null: false, foregin_key: true
      t.float :result, null: false
      t.timestamps
    end
  end
end
