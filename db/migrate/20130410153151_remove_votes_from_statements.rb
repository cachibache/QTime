class RemoveVotesFromStatements < ActiveRecord::Migration
  def up
    remove_column :statements, :no_false
    remove_column :statements, :no_true
  end

  def down
    add_column :statements, :no_true, :integer
    add_column :statements, :no_false, :integer
  end
end
