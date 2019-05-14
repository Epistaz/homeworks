# describes Git
module Git
  # comment
  module API
    def repositories
      @repositories ||= []
    end

    def create_repo(name)
      Repository.create(name: name, author: self)
    end

    def create_pull_request(title:)
      PullRequest.new(title: title, author: self)
    end

    def create_commit(title:, body:)
      Commit.new(title: title, body: body, author: self)
    end
  end
end

# comment
class Notifier
  def notify!(from, to, content, attached_content)
    to.notifications << Notification.new(from, to, content, attached_content)
  end

  private

  def send_post; end
end
