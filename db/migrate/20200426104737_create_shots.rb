class CreateShots < ActiveRecord::Migration[5.1]
  def change
    create_table :shots do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
