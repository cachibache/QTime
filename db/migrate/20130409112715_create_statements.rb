class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.string :statement
      t.boolean :true_or_false

      t.timestamps
    end
  end
end
