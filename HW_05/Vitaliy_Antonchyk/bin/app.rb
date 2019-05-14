$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "mentor"
require "student"
require "git"

student = Student.new(name: "Lorem")
mentor = Mentor.new(name: "Ipsum")

Git::Core.register_user(student)
Git::Core.register_user(mentor)

student.subscribe_to(mentor)

repo = mentor.create_repo(name: "labs-ruby")
hwk = mentor.create_homework(title: "hw_5",
                             body: "guess tnumber between 1..20 ",
                             target_repo: repo)

student.do_homework(hwk)
# p mentor.notifications.count

mentor.read_notifications!
mentor.check_homeworks!(repo)
# p student.notifications.count

student.read_notifications!
