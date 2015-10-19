class Message < ActiveRecord::Base
  belongs_to :conversation, touch: true
  belongs_to :user

  delegate :username, to: :user, prefix: false, allow_nil: true
end
