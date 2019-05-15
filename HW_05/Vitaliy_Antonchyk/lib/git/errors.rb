module Git
  # describes errror UserAlreadyExists
  class UserAlreadyExists < StandardError
    def initialize(user = nil)
      super("User #{user} already registerd")
    end
  end

  # describes errror UserAlreadyExists
  class RepositoryNameAlreadyTaken < StandardError
    def initialize(repo = nil)
      super("Repo #{repo}name already exists")
    end
  end

  # describes errror UserAlreadyExists
  class RepositoryNotFound < StandardError
    def initialize(repo = nil)
      super("Repo #{repo} not found")
    end
  end
end
