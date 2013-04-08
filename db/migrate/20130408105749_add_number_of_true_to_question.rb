class AddNumberOfTrueToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :answer, :string, :null => false
  end
end
