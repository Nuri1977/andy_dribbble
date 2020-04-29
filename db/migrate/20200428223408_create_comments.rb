class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :response
      t.references :user, foreign_key: true
      t.references :shot, foreign_key: true

      t.timestamps
    end
  end
end
