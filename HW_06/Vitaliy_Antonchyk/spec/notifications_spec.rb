require 'notifications'
require 'webmock/rspec'

describe Notifications do
  subject { Object.new.extend(Notifications) }
  let (:other) { Object.new.extend(Notifications) }

  it 'has a subscribers' do
    expect(subject.subscribers).to eq([])
  end

  it 'has a subscriptions' do
    expect(subject.subscriptions).to eq([])
  end

  describe '#subscribe_to' do
    it 'should raise if target ddnt includes Subscribtions' do
      target = Object.new
      expect { subject.subscribe_to(target) }.to raise_error
    end

    it { expect { subject.subscribe_to(other) }.to change { other.subscribers.count }.by(1) }
    it { expect { subject.subscribe_to(other) }.to change { subject.subscriptions.count }.by(1) }
    it 'should raise if already subscribed' do
      subject.subscribe_to(other)
      expect { subject.subscribe_to(other) }.to raise_error
    end
  end
end
describe Notifications::Notifications do
  subject { Object.new.extend(Notifications) }
  let (:other) { Object.new.extend(Notifications) }

  it 'has a notifications' do
    expect(subject.subscribers).to eq([])
  end
  describe '#read_notifications!' do
    let(:notification_params) do
      {
        from: :from, to: :to, body: :body
      }
    end
    let(:notif_read) { Notification.new(notification_params).read! }
    let(:notif_unreaded) { Notification.new(notification_params) }
    before(:each) { subject.notifications.push(notif_read, notif_unreaded) }
    it { expect { subject.read_notifications! }.to change { subject.unreaded_notifications.count }.to(0) }
  end

  describe 'helpers' do
    context 'empty notifications' do
      describe '#unreaded_notifications' do
        it { expect(subject.unreaded_notifications).to eq [] }
      end
      describe '#readed_notifications' do
        it { expect(subject.readed_notifications).to eq [] }
      end
    end

    context 'populited notifications' do
      let(:notif_read) { instance_double(Notification, read_status: true) }
      let(:notif_unread) { instance_double(Notification, read_status: false) }
      before(:each) { subject.notifications.push(notif_read, notif_unread) }
      after(:each) { subject.notifications.pop(100) }
      describe '#unreaded_notifications' do
        it { expect(subject.unreaded_notifications.count).to eq 1 }
      end
      describe '#readed_notifications' do
        it { expect(subject.readed_notifications.count).to eq 1 }
      end
    end
  end
end

describe Notifications::HttpNotifier do
  subject { Notifications::HttpNotifier }
  let(:url) { URI('https://www.example.com') }
  before { stub_request(:post, url).to_return(status: 200) }
  describe '.submit' do
    it { expect(subject.submit.is_a?(Net::HTTPOK)).to eq true }
  end
end
