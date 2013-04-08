class AddNumberOfTrueToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :number_of_true, :integer
  end
end
