class CompetesController < ApplicationController
	before_action :require_login

	def create
		comp = Competition.find(params[:id])

		Compete.create(user:current_user, competition:comp) unless comp.competidors.include? current_user

		return redirect_to '/competitions'
	end

	def destroy
		comp = Competition.find(params[:id])
		compete = Compete.find_by(competition: comp, user: current_user)

		compete.delete unless compete === nil

		return redirect_to '/competitions'
	end
end
