class TopicsController < ApplicationController
  def index
    @categories = Category.includes(:topics).order(:display_order)
  end

  def show
    redirect_to topic_conversations_path(Topic.find(params[:id]))
  end
end
