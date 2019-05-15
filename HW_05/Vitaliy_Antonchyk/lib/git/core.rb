module Git
  # describes Core
  class Core
    class << self
      def repositories
        @repositories ||= []
      end

      def add_repo(repo)
        error_flag = repo_name_exist?(repo.name)
        raise(Git::RepositoryNameAlreadyTaken, repo) if error_flag

        repositories << repo
      end

      def find_repo(repo)
        rez = repositories.find { |repository| repository == repo }
        raise Git::RepositoryNotFound, repo unless rez

        rez
      end

      def repo_name_exist?(repo_name)
        repositories.any? { |repository| repository.name == repo_name }
      end
    end
  end
end
