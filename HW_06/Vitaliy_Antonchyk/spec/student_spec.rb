# rubocop:disable all

describe Student do
  let(:params) do
    {
      name: :name,
    }
  end
  subject { described_class.new(params) }

  describe "has a name" do
    it { expect(subject.name).to eq(:name) }
  end

  describe "#do_homework" do
    let(:hw_author) { double("User", notifications: []) }
    let(:repo) { Git::Repository.new(author: hw_author, name: :name) }
    let(:homework) do
      instance_double(Homework,
                      title: :title,
                      body: :body,
                      author: hw_author,
                      target_repo: repo)
    end
    it { expect { subject.do_homework(homework) }.to change { repo.pull_reqests.count }.by(1) }
    it { expect { subject.do_homework(homework) }.to change { hw_author.notifications.count }.by(1) }
  end
end
# rubocop:enable all
