class UserSkill < ActiveRecord::Base
	attr_accessible :skill_id
	belongs_to :user
	belongs_to :skill
	validates :user_id, :presence => true
	validates :skill_id, :presence => true
end
