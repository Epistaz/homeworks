module Git
  class PullRequest
    attr_reader :title, :author, :commits, :status #, :send?

    STATUSES = {
      open: "Open",
      merged: "Merged",
      closed: "Closed",
    }.freeze

    def initialize(author:, title:)
      @author = author
      @title = title
      @status = :open
    end

    def commits
      @commits ||= []
    end

    def add_commits(*items)
      commits.push(*items)
    end

    def status
      STATUSES[@status]
    end

    def merge
      #some code to add commits
      @status = :merged
    end

    def close
      @status = :closed
    end

  end
end
