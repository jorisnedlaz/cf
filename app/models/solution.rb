class Solution < ActiveRecord::Base
	
	belongs_to :problem
	has_many :votes
	validates :value, 	:presence => true,
						:length => {:maximum => 100}
	
end
