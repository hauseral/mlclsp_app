class CreateProblemSolutions < ActiveRecord::Migration
  def self.up
    create_table :problem_solutions do |t|
      t.string :product_name
      t.integer :period_name
      t.integer :production_quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :problem_solutions
  end
end
