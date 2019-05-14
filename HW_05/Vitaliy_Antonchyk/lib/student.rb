require_relative 'notifications'
require 'person'

# describes Student
class Student < Person
  include Notifications

  def do_homework(homework)
    pr_title = "#{homework.title}_solution"
    pr = create_pull_request(title: pr_title)
    body = rand(1..10)
    commit_one = create_commit(title: 'adding tests', body: body)
    commit_two = create_commit(title: 'adding code', body: body)
    pr.add_commits(commit_one, commit_two)
    homework.target_repo.add_pull_reqest(pr)
  end
end
