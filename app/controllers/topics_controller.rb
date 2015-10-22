class TopicsController < ApplicationController
  def index
    @categories = Category.includes(:topics).order(:display_order)
  end

  def show
    @topic = Topic.find(params[:id])
    redirect_to topic_conversations_path(@topic)
  end
end
