class AddNumberOfFalseToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :number_of_false, :integer
  end
end
