class Conversation < ActiveRecord::Base
  belongs_to :topic, touch: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages
end
