class CreateUserSkills < ActiveRecord::Migration
  def self.up
    create_table :user_skills do |t|
      t.integer :user_id
      t.integer :skill_id

      t.timestamps
    end
	add_index :user_skills, :user_id
	add_index :user_skills, :skill_id
	add_index :user_skills, [:user_id,:skill_id], :unique => true
  end

  def self.down
    drop_table :user_skills
  end
end
