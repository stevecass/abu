class ConversationsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @conversations = @topic.conversations.order(updated_at: :desc)
  end
  
  def show
    @conversation = Conversation.find(params[:id])
  end

  def recent
    @conversations = Conversation.by_recency
  end
end
