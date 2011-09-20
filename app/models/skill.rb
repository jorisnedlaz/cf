class Skill < ActiveRecord::Base
	attr_accessible :description
	has_many :user_skills, :dependent => :destroy
end
