class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :conversations

  def conversations_reverse_cron
    conversations.order(updated_at: :desc)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
