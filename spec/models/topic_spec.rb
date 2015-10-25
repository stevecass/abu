require 'rails_helper'

RSpec.describe Topic do

  let(:conversation) { FactoryGirl.create(:conversation)}
  let(:topic) { FactoryGirl.create(:topic)}

  it { is_expected.to  have_many :conversations}
  it { is_expected.to  belong_to :category}

  it 'responds to to_param' do
    expect(topic.to_param).to eq("#{topic.id}-#{topic.name.parameterize}")
  end

  it 'contains conversations in reverse chronological order' do
    c1 = FactoryGirl.create(:conversation, topic:topic)
    c2 = FactoryGirl.create(:conversation, topic:topic)
    c3 = FactoryGirl.create(:conversation, topic:topic)
    expect(topic.conversations_reverse_cron).to eq([c3, c2, c1])
  end

end