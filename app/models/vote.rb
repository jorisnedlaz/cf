class Vote < ActiveRecord::Base
	attr_accessible :comment, :solution_id
	belongs_to :solution
	belongs_to :user
	validates :comment, :presence =>true,
						:length =>{ :maximum => 512 }
end
