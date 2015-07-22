class ChangeColumnName < ActiveRecord::Migration
  def up
      change_column :chores, :done, :string
    end
end
