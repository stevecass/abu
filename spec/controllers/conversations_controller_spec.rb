require 'rails_helper'

describe ConversationsController do

  let (:conversation) { FactoryGirl.create(:conversation)}

  describe '#index' do

    it 'is successful' do
      get :index, topic_id: conversation.topic_id
      expect(response.status).to eq(200)
    end

    it 'assigns the topic' do
      get :index, topic_id: conversation.topic_id
      expect(assigns(:topic)).to eq(conversation.topic)
    end

    it 'loads the conversations' do
      get :index, topic_id: conversation.topic_id
      expect(assigns(:conversations)).to match_array(conversation.topic.conversations.order(updated_at: :desc))
    end
  end

  describe '#show' do
    it 'is successful' do
      get :show, topic_id: conversation.topic_id, id:conversation.id
      expect(response.status).to eq(200)
    end

    it 'loads the conversation' do
      get :show, topic_id: conversation.topic_id, id:conversation.id
      expect(assigns(:conversation)).to eq(conversation)
    end
  end

  describe '#recency' do
    it 'is successful' do
      get :show, topic_id: conversation.topic_id, id:conversation.id
      expect(response.status).to eq(200)
    end

    it 'loads recent conversations' do
      get :recent
      expect(assigns(:conversations)).to eq(Conversation.by_recency)
    end
  end

end