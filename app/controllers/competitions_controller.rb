class CompetitionsController < ApplicationController
	before_action :require_login

	def index
		@user = User.find(current_user)
		# @payed = Competes.where(user_id: current_user.id)
		@user_comps = Competition.where(user_id: current_user.id)
		@user_st_comp = Competition.where(state: current_user.state, skill: current_user.skill)
		@user_skill = Competition.where(skill: current_user.skill).where.not(state: current_user.state)
		@user_state = Competition.where.not(skill: current_user.skill).where(state: current_user.state)
		@other_states = Competition.where.not(state: current_user.state)
		@states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY" ]
		@skill = ["Beginner", "Intermediate", "Advanced"]
		@time = Time.new
	end

	def create
		@competition = Competition.new(comp_params)

		if @competition.save
			flash[:notice] = ["Successfully Created Competition"]
			return redirect_to competitions_path
		end

		flash[:errors] = @competition.errors.full_messages
		return redirect :back
	end

	def show
		@comp = Competition.find(params[:id])
		@message = Message.all
	end

	def edit
		@comp = Competition.find(params[:id])
		@states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY" ]
		@skill = ["Beginner", "Intermediate", "Advanced"]
	end


	private
		def comp_params
			params.require(:competition).permit(:name, :date, :skill, :city, :state, :desc).merge(user: current_user)
		end
end
