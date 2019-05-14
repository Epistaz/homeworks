require 'notification'
require 'net/http'
require 'json'
# describes Notifications
module Notifications
  # describes Subscribtions
  module Subscribtions
    def subscribers
      @subscribers ||= []
    end

    def subscriptions
      @subscriptions ||= []
    end

    def subscribe_to(subject)
      check_if_notifiable(subject)
      check_if_already_subscrbed(subject)
      subject.subscribers << self
      subscriptions << subject
    end

    # def unsubscribe_from(subject)
    #   check_if_notifiable(subject)
    #   subject.subscribers.delete(self)
    #   subscriptions.delete(subject)
    # end

    private

    def check_if_notifiable(subject)
      error = "Class #{subject.class} be notify"
      raise error unless subject.is_a?(Subscribtions)
    end

    def check_if_already_subscrbed(subject)
      error = "alredy subscribed to #{subject}"
      raise error if subscriptions.include?(subject)
    end
  end

  # describes Notifications
  module Notifications
    def notifications
      @notifications ||= []
    end

    def unreaded_notifications
      notifications.reject(&:read_status)
    end

    def readed_notifications
      notifications.select(&:read_status)
    end

    def read_notifications!
      unreaded_notifications.each(&:read!)
    end
  end

  # describes Notifier
  class Notifier
    def notify_subscribers!(from:, body:, attached: nil)
      from.subscribers.each do |sub|
        notify!(from: from, to: sub, body: body, attached: attached)
      end
    end

    def notify!(from:, to:, body:, attached: nil)
      new_notif = Notification.new(from: from,
                                   to: to, body: body,
                                   attached: attached)
      to.notifications << new_notif
      url = URI('https://www.example.com')
      json = attached.to_json || {}
      HttpNotifier.submit(url, json)
    end
  end

  # describes HttpNotifier
  class HttpNotifier
    def self.submit(url, json = {})
      Net::HTTP.post(url, json.to_json)
    end
  end

  include Subscribtions
  include Notifications
end
