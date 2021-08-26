class Changedefaultseason < ActiveRecord::Migration[6.0]
  def change
    change_column_default :recipes, :season, 0
  end
end
