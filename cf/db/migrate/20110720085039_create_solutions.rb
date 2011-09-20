class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.integer :problem_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end
