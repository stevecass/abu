class MessagesController < ApplicationController
  def create
    msg = Message.create(message_params)
    if request.xhr?
      if msg.save
        render partial: 'message'
      else
        render text: msg.errors.full_messages, status: 422
      end
    else
      if msg.save
        redirect_to topic_conversation_path(msg.conversation.topic_id, msg.conversation)
      else
        @conversation = Conversation.find(params[:message][:conversation_id])
        flash.now.alert = msg.errors.full_messages.join(', ')
        render 'conversations/show'
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:conversation_id, :content).merge(user: current_user)
  end
end