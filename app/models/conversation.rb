class Conversation < ActiveRecord::Base
  belongs_to :topic, touch: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages, -> {order(created_at: :desc)}
  validates :name, presence: true
  validates :author, presence: true
  validates :topic, presence: true
  validates_associated :messages

  delegate :name, to: :topic, prefix: true, allow_nil: true
  delegate :id, to: :topic, prefix: true, allow_nil: true

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

end
