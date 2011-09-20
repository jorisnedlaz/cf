class Problem < ActiveRecord::Base
	
	belongs_to :user
	has_many :solutions, :dependent => :destroy
	accepts_nested_attributes_for :solutions, 
	  :reject_if => lambda { |a| a[:value].blank? }, :allow_destroy => true  
	
	validates	:title, :presence => true,
						:length   => { :maximum => 50 }
	validates	:description, 	:presence => true,
								:length   => { :maximum => 1024 }
	default_scope :order => 'problems.created_at DESC'

end
