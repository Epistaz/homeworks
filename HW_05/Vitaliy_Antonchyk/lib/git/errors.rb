module Git
  class UserAlreadyExists < StandardError
    def initialize(user = nil)
      super("User #{user} already registerd")
    end
  end

  class RepositoryAlreadyExists < StandardError
    def initialize(repo = nil)
      super("Repo #{repo} already exists")
    end
  end

  class RepositoryNotFound < StandardError
    def initialize(repo = nil)
      super("Repo #{repo} not found")
    end
  end
end