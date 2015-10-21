class Api::ConversationsController < Api::ApiController

  def index
    render json: Topic.find(params[:topic_id]).conversations_reverse_cron
  end

  def show
    conv = Conversation.find(params[:id])
    render json: conv.to_json(include: [:messages])
  end
end