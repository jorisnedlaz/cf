class Vote < ActiveRecord::Base
	attr_accessible :comment
	belongs_to :solution
	validates :comment, :presence =>true,
						:length =>{ :maximum => 512 }
end
