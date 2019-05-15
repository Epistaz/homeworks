require 'notifications'
require 'homework'
require 'person'
require 'git'

# describes Mentor
class Mentor < Person
  include Notifications
  include Git::API

  def create_homework(title:, body:, target_repo:)
    Homework.new(title: title, body: body,
                 author: self,
                 target_repo: target_repo)
  end

  def check_homeworks!(repo)
    repo.new_pull_reqests.each { |plrquest| check_homework(plrquest) }
  end

  def check_homework(plrquest)
    hws_temp = plrquest.commits.sum { |commit| commit.body.to_i }
    hws_temp > 5 ? plrquest.merge : plrquest.close
  end
end
