require 'rails_helper'

describe MessagesController do

  let(:user) { User.create(username:'steven', email:'steven@example.com', password:'abc1234')}
  let(:valid_attrs) { FactoryGirl.build(:message).attributes }
  let(:invalid_attrs){ FactoryGirl.build(:message, content:nil ).attributes }

  describe '#create' do

    it 'creates a message from valid parameters' do
      expect do 
        post :create, {message: valid_attrs }
      end.to change{Message.count}.by(1)
    end

    it 'redirects after creating a message' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      post :create, {message:  valid_attrs }
      conv = Conversation.find(valid_attrs["conversation_id"])
      expect(response).to redirect_to topic_conversation_path(conv.topic, conv)
    end

    it 'does not redirect on invalid parameters' do
      post :create, {message: invalid_attrs }
      expect(response).to render_template('conversations/show')
    end

    it 'does not create a message if params invalid' do
            expect do 
        post :create, {message: invalid_attrs }
      end.not_to change{Message.count}

    end

  end

end