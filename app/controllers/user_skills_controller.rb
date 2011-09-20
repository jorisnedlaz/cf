class User_skillsController < ApplicationController
	before_filter :authenticate

	def create
		@skill = User.find(params[:user_skill][:skill_id])
    	current_user.ad_skill!(@skill)
    	redirect_to @user
	end

	def destroy
		@skill = User_skill.find(params[:id]).skill
    	current_user.remove_skill!(@skill)
    	redirect_to @user
	end
end
