class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :conversations

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
 