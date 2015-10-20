require 'rails_helper'

describe MessagesController do

  let(:user) { FactoryGirl.create(:user)}
  let(:valid_attrs) { FactoryGirl.build(:message).attributes }
  let(:invalid_attrs){ FactoryGirl.build(:message, content:nil ).attributes }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe '#create' do

    it 'creates a message from valid parameters' do
      expect do 
        post :create, {message: valid_attrs }
      end.to change{Message.count}.by(1)
    end

    it 'redirects after creating a message' do
      post :create, {message:  valid_attrs }
      conv = Conversation.find(valid_attrs["conversation_id"])
      expect(response).to redirect_to topic_conversation_path(conv.topic, conv)
    end

    it 'does not redirect on invalid parameters' do
      post :create, {message: invalid_attrs }
      expect(response).to render_template('conversations/show')
    end

    it 'does not create a message if params invalid' do
      expect{post :create, {message: invalid_attrs }}.not_to change{Message.count}
    end

  end

end