require 'rails_helper'

RSpec.describe User do

  let(:user) { FactoryGirl.build(:user) }

  it { should validate_presence_of :email }

  it 'should respond to email' do
    expect(user).to respond_to(:email)
  end

end