require 'spec_helper'

describe Messenger::Workers::NamespacedTest do

  describe 'work' do
    let(:worker) { Messenger::Workers::NamespacedTest.new }

    context 'with #work' do
      it { worker.respond_to?(:work).should be_true }
    end

    context 'without #work' do
      before :all do
        class Messenger::Workers::NamespacedTest
          alias :temp_work :work
          remove_method :work
        end
      end

      after :all do
        class Messenger::Workers::NamespacedTest
          alias :work :temp_work
          remove_method :temp_work
        end
      end

      it { expect { worker.work 'on something' }.to raise_error NotImplementedError }
      it { worker.respond_to?(:work).should be_true }
    end
  end

end
