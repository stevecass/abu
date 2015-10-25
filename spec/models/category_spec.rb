require 'rails_helper'

RSpec.describe Category do
  it {is_expected.to have_many :topics }

end