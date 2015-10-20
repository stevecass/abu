require 'rails_helper'

RSpec.feature 'Adding message features' do
  let!(:msg) { FactoryGirl.create(:message) }
  let(:new_msg) { FactoryGirl.build(:message) }
  let(:user) { FactoryGirl.create(:user) }

  def log_in
    visit login_path
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Log in'
  end

  def post_message_with_content str
    visit topic_conversation_path(msg.conversation.topic, msg.conversation)
    fill_in 'message_content', with: str
    click_button 'Create Message'
  end

  def test_message_posting
    existing = msg.id
    post_message_with_content new_msg.content
    selector = "[data-id=\"m#{existing + 1}\"]"
    expect(page).to have_selector(selector)
  end


  scenario "Won't add a blank messsage", js:false do
    log_in
    post_message_with_content ""
    expect(page).to have_content("Content can't be blank")
  end

  scenario "Won't add a blank messsage with ajax", js:true do
    log_in
    post_message_with_content ""
    expect(page).to have_content("Content can't be blank")
  end

  scenario 'Adds a message to an existing conversation without js', js:false do
    log_in
    test_message_posting
  end

  scenario 'Adds a message to an existing conversation with ajax', js:true do
    log_in
    test_message_posting
  end

end
