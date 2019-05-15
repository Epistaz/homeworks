# rubocop:disable all

describe Mentor do
  let(:params) { { name: :name } }

  subject { described_class.new(params) }

  describe "has a name" do
    it { expect(subject.name).to eq(:name) }
  end

  describe "homeworks" do
    describe "#create_homework" do
      let(:homework_params) do
        {
          title: :title,
          body: :body,
          target_repo: :repo,
        }
      end
      it { expect(subject.create_homework(homework_params)).to be_instance_of(Homework) }
    end

    let(:repo) { instance_double(Git::Repo, pull_reqests: [pull_requst]) }

    describe "#check_homework" do
      context "incorrect homework" do
        let(:commit) { instance_double(Git::Commit, body: 3) }
        let(:pull_requst) do
          pr = Git::PullRequest.new(author: :a, title: :title)
          pr.commits << commit
          pr
        end
        it { expect { subject.check_homework(pull_requst) }.to change { pull_requst.status }.to("Closed") }
      end
      context "correct homework" do
        let(:commit) { instance_double(Git::Commit, body: 7) }
        let(:pull_requst) do
          pr = Git::PullRequest.new(author: :a, title: :title)
          pr.commits << commit
          pr
        end
        it { expect { subject.check_homework(pull_requst) }.to change { pull_requst.status }.to("Merged") }
      end
    end
  end
end
# rubocop:enable all
