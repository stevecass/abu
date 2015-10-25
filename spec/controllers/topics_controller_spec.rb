require 'rails_helper'

describe TopicsController do

  let(:topic) { FactoryGirl.create(:topic)}

  describe '#index' do
    it 'is a success' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'loads a list of categories' do
      get :index
      expect(assigns(:categories)).to eq(Category.includes(:topics).order(:display_order))
    end
  end

  describe '#show' do
    it 'redirects to conversations' do
      get :show, id: topic.id
      expect(response).to redirect_to(topic_conversations_path(topic))
    end
  end

end
