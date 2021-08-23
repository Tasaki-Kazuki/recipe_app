class ChengeSeasonDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:seasons, :season, 0)
  end
end
