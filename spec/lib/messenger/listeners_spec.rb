require 'spec_helper'

describe Messenger::Listeners::NamespacedTest do

  describe 'listen' do
    let(:listener) { Messenger::Listeners::NamespacedTest.new }

    it { listener.respond_to?(:worker=).should be_true }
    it { listener.respond_to?(:worker).should be_true }

    context 'with #listen' do
      it { listener.respond_to?(:listen).should be_true }
    end

    context 'without #listen' do
      before :all do
        class Messenger::Listeners::NamespacedTest
          alias :temp_listen :listen
          remove_method :listen
        end
      end

      after :all do
        class Messenger::Listeners::NamespacedTest
          alias :listen :temp_listen
          remove_method :temp_listen
        end
      end

      it { expect { listener.listen }.to raise_error NotImplementedError }
      it { listener.respond_to?(:listen).should be_true }
    end
  end

end
