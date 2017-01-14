class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :original
      t.string :shortened
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
