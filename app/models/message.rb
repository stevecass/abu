class Message < ActiveRecord::Base
  belongs_to :conversation, touch: true
  belongs_to :user

  validates :content, presence: true

  delegate :username, to: :user, prefix: false, allow_nil: true

  def in_caps
    content.upcase if content
  end
end
