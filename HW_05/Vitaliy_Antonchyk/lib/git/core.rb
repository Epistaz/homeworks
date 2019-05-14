module Git
  # describes Core
  class Core
    class << self
      def users
        @users ||= []
      end

      def repositories
        @repositories ||= []
      end

      def register_user(user)
        raise Git::UserAlreadyExists, user if users.include? user

        user.extend(Git::API)
        users << user
      end

      def add_repo(repo)
        rez = repositories.find { |repository| repository.name == repo.name }
        raise Git::RepositoryAlreadyExists, repo if rez

        repositories << repo
      end

      def find_repo(repo)
        rez = repositories.find { |repository| repository.name == repo.name }
        raise Git::RepositoryNotFound, repo unless rez

        rez
      end
    end
  end
end
