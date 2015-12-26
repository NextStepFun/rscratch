require 'spec_helper'

class DummyTestDSL < RScratch::DSL

  translate :it, 
    inverti: {
      name: 'revert',
      args: { 'messaggio': :message }
    } 

  def revert message: ''
    message.reverse
  end

end

describe RScratch::DSL do
  let(:dsl) { DummyTestDSL.new }

  it { expect(dsl.respond_to?(:revert)).to be true }
  it { expect(dsl.revert(message: 'test')).to eq('tset')}

  describe "Internationalized" do
     before do
       RScratch::LANG = :it
     end

     it { expect(dsl.respond_to?(:inverti)).to be true }
     it { expect(dsl.inverti(messaggio: 'test')).to eq('tset')}
  end
end
