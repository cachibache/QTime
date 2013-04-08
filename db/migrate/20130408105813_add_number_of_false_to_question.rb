class AddNumberOfFalseToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :false, :integer, :default => 0
  end
end
