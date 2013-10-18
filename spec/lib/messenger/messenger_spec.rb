require 'spec_helper'

describe Messenger do

  context 'non namespaced worker/listener' do

    let(:messenger) { Messenger.new }

    before do
      Messenger.configure do |config|
        config.listener_type = :test
        config.worker_type = :test
      end
    end

    describe '#listen' do
      it 'should delegate listen to listener' do
        messenger.listener.should_receive :listen
        messenger.listen
      end
    end

    describe '#work' do
      it 'should delegate work to worker' do
        messenger.worker.should_receive :work
        messenger.work 'on something'
      end
    end
  end

  context 'namespaced worker/listener' do

    let(:messenger) { Messenger.new }

    before do
      Messenger.configure do |config|
        config.listener_type = :namespaced_test
        config.worker_type = :namespaced_test
      end
    end

    describe '#listen' do
      it 'should delegate listen to listener' do
        messenger.listener.should_receive :listen
        messenger.listen
      end
    end

    describe '#work' do
      it 'should delegate work to worker' do
        messenger.worker.should_receive :work
        messenger.work 'on something'
      end
    end
  end

  describe 'configure' do
    it 'should require a block' do
      expect { Messenger.configure }.to raise_error LocalJumpError
    end
  end

end
