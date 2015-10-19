class TopicsController < ApplicationController
  def index
    @categories = Category.includes(:topics).order(:display_order)
  end
end
