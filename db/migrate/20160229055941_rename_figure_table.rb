class RenameFigureTable < ActiveRecord::Migration
  def change
    rename_table :figure, :figures
  end
end
