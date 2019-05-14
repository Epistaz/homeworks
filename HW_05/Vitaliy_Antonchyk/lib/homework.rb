require "notifications"
#describes Homework
class Homework
  attr_reader :title, :body, :author, :target_repo

  def initialize(title:, body:, author:, target_repo:)
    @title = title
    @body = body
    @author = author
    @target_repo = target_repo
    Notifications::Notifier.new.notify_subscribers!(from: author,
                                                    body: title,
                                                    attached: self)
  end

  def to_json
    { title: title, body: body, student: author }
  end
end
