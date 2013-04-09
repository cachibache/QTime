class AddNoTrueToStatement < ActiveRecord::Migration
  def change
    add_column :statements, :no_true, :integer, :default => 0
  end
end
