class AddNoFalseToStatement < ActiveRecord::Migration
  def change
    add_column :statements, :no_false, :integer, :default => 0
  end
end
