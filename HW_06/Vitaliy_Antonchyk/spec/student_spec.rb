describe Student do
  let(:params) do
    {
      name: :name
    }
  end
  subject { described_class.new(params) }

  describe 'has a name' do
    it { expect(subject.name).to eq(:name) }
  end

  describe '#do_homework' do
    before(:each) { Git::Core.register_user(subject) }
    let(:hw_author) do
      obj = Object.new
      obj.extend(Notifications)
      obj
    end
    let(:repo) { Git::Repository.new(name: :name, author: hw_author) }
    let(:homework) do
      Homework.new(title: :title,
                   body: :body,
                   author: hw_author,
                   target_repo: repo)
    end
    it { expect { subject.do_homework(homework) }.to change { repo.pull_reqests.count }.by(1) }
    it { expect { subject.do_homework(homework) }.to change { hw_author.notifications.count }.by(1) }
  end
end
