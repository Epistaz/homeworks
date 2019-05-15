$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'mentor'
require 'student'
require 'git'

student = Student.new(name: 'Lorem')
mentor = Mentor.new(name: 'Ipsum')

student.subscribe_to(mentor)

repo = mentor.create_repo(name: 'labs-ruby')
hwk = mentor.create_homework(title: 'hw_5',
                             body: 'guess tnumber between 1..20 ',
                             target_repo: repo)

student.do_homework(hwk)
mentor.read_notifications!
p mentor.notifications
mentor.check_homeworks!(repo)
p student.notifications

student.read_notifications!
