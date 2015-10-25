require 'rails_helper'

describe SessionsController do

  let(:user) { FactoryGirl.create(:user) }

  describe '#create' do
    context 'valid credentials' do
      it 'logs user in with valid credentials' do
        post :create, username: user.username, password: user.password
        expect(session[:user_id]).to eq(user.id)
      end
      it 'redirects to root on successful login' do
        post :create, username: user.username, password: user.password
        expect(response).to redirect_to root_path
      end
    end

    context 'invalid credentials' do
      it 'does not log user in ' do
        post :create, username: user.username, password: user.password + 'extra'
        expect(session[:user_id]).to_not eq(user.id)
      end
      it 'renders new on unsuccessful login' do
        post :create, username: user.username, password: user.password + 'extra'
        expect(response).to render_template :new
      end
    end
  end

  context '#destroy' do
    it 'clears the session' do
      get :destroy
      expect(session).to be_empty
    end

    it 'redirects to root' do
      get :destroy
      expect(response).to redirect_to root_path
    end

  end

end