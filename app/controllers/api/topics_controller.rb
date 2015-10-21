class Api::TopicsController < Api::ApiController

  def index
    render json: Topic.all.to_json(include: [:category])
  end

  def show
    topic = Topic.find(params[:id])
    render json: topic.to_json(include: [:conversations_reverse_cron])
  end
end