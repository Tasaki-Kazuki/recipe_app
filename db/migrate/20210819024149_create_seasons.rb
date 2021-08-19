class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.integer :season
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
