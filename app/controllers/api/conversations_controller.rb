class Api::ConversationsController < Api::ApiController

  def index
    render json: Topic.find(params[:topic_id]).conversations_reverse_cron
  end

  def show
    conv = Conversation.find(params[:id])
    render json: conv.to_json({include: {messages: {methods: :username}} })
  end

  def recent
    render json: Conversation.by_recency, methods: :latest_message
  end
end