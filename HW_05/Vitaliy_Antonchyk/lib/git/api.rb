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
