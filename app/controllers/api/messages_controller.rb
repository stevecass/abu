class Api::MessagesController < Api::ApiController
  def create

    render text: 'Not logged in', status: 422 and return  unless current_user


    msg = Message.new(message_params)
    if msg.save
      render json: msg
    else
      render text: msg.errors.full_messages.join(' '), status: 422
    end
  end

  private

  def message_params
    params.require(:message).permit(:conversation_id, :content).merge(user: current_user)
  end

end
