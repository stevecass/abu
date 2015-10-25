require 'rails_helper'

RSpec.describe Conversation do

  let(:conversation) { FactoryGirl.create(:conversation)}
  let(:topic) { FactoryGirl.create(:topic)}

  it { is_expected.to belong_to :topic}
  it { is_expected.to belong_to :author}
  it { is_expected.to have_many :messages}
  it { is_expected.to validate_presence_of :name}
  it { is_expected.to validate_presence_of :author}
  it { is_expected.to validate_presence_of :topic}

  it 'delegates topic_name' do
    expect(conversation.topic_name).to eq(conversation.topic.name)
  end

  it 'delegates topic_id' do
    expect(conversation.topic_id).to eq(conversation.topic.id)
  end

  it 'returns latest message' do
    m1 = FactoryGirl.create(:message, conversation: conversation)
    m2 = FactoryGirl.create(:message, conversation: conversation)
    m3 = FactoryGirl.create(:message, conversation: conversation)
    expect(conversation.latest_message).to eq(m3)
  end

  it 'parameterizes' do
    expect(conversation.to_param).to eq("#{conversation.id}-#{conversation.name.parameterize}")
  end

  it 'loads meesages by recency' do
    c1 = FactoryGirl.create(:conversation)
    m1 = FactoryGirl.create(:message, conversation: c1)
    m2 = FactoryGirl.create(:message, conversation: conversation)
    expect(Conversation.by_recency).to eq([conversation, c1])
  end

  context '#with_no_messages' do
    it 'finds includes conversations with no messages' do
      c = FactoryGirl.create(:conversation)
      m1 = FactoryGirl.create(:message, conversation: conversation)
      expect(Conversation.with_no_messages).to include(c)
    end

    it 'does not include conversations with messages' do
      c = FactoryGirl.create(:conversation)
      m1 = FactoryGirl.create(:message, conversation: conversation)
      expect(Conversation.with_no_messages).not_to include(conversation)
    end
  end


end




=begin
def latest_message
    messages.order(id: :desc).first
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.by_recency
    order(updated_at: :desc)
  end

  def self.with_no_messages
    includes(:messages).where(messages: {id:nil})
  end



    belongs_to :topic, touch: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages, -> {order(created_at: :desc)}
  validates :name, presence: true
  validates :author, presence: true
  validates :topic, presence: true
  validates_associated :messages

  delegate :name, to: :topic, prefix: true, allow_nil: true
  delegate :id, to: :topic, prefix: true, allow_nil: true

=end