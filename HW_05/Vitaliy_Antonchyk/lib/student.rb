require 'notifications'
require 'person'

# describes Student
class Student < Person
  include Notifications
  include Git::API

  def do_homework(homework)
    pr_title = "#{homework.title}_solution"
    pr = create_pull_request(title: pr_title)
    commit_body = rand(1..10)
    commit_one = create_commit(title: 'adding tests', body: commit_body)
    pr.add_commits(commit_one)
    homework.target_repo.add_pull_reqest(pr)
  end
end
