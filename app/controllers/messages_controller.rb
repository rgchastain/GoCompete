class MessagesController < ApplicationController
	before_action :require_login

	def create
		comp_id = params[:message][:competition_id]
		@message = Message.create(message_params)

		return redirect_to competition_path(comp_id) if @message.valid?

		flash[:errors] = @message.errors.full_messages

		return redirect_to fallback_location: competition_path(comp_id)
	end



	private
		def message_params
			params.require(:message).permit(:content, :competition_id).merge(user: current_user)
		end
end
