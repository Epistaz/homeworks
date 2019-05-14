require "notifications"

module Git
  class Repository
    attr_reader :author

    def initialize(name:, author:)
      @author = author
      @name = name
    end

    def name
      @name
    end

    def commits
      @commits ||= []
    end

    def pull_reqests
      @pull_reqests ||= []
    end

    def new_pull_reqests
      pull_reqests.select { |plr| plr.status == "Open" }
    end

    def add_pull_reqest(plrequest)
      pull_reqests << plrequest
      Notifications::Notifier.new.notify!(to: self.author,
                                          from: plrequest.author,
                                          body: plrequest.title,
                                          attached: plrequest)
    end

    def self.create(name:, author:)
      repo = new(name: name, author: author)
      Core.add_repo(repo)
      author.repositories << repo
      repo
    end
  end
end
