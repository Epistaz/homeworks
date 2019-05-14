module Git
  class Commit
    attr_reader :body, :title, :author

    def initialize(title:, body:, author:)
      @author = author
      @title = title
      @body = body
    end
  end
end
