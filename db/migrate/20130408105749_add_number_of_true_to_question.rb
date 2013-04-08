class AddNumberOfTrueToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :true, :integer, :default => 0
  end
end
