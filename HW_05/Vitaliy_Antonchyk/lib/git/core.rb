module Git
  class Core
    class << self
      def users
        @users ||= []
      end

      def repositories
        @repositories ||= []
      end

      def register_user(user)
        raise Git::UserAlreadyExists.new(user) if users.include? user
        user.extend(Git::API)
        users << user
      end

      def add_repo(repo)
        rez = repositories.find { |_repo| _repo.name == repo.name }
        raise Git::RepositoryAlreadyExists.new(repo) if rez
        repositories << repo
      end

      def find_repo(repo)
        rez = repositories.find { |_repo| _repo.name == repo.name }
        raise Git::RepositoryNotFound.new(repo) unless rez
        rez
      end
    end
  end
end
