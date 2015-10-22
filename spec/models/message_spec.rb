require 'rails_helper'

RSpec.describe Message do
 
  context '#in_caps' do
    it 'should return the message in caps' do
      msg = Message.new(content:'Hello')
      expect(msg.in_caps).to eq('HELLO')
    end
    
    it 'should tolerate nil content' do
      msg = Message.new(content:nil)
      expect{msg.in_caps}.not_to raise_exception
    end
  end
end
