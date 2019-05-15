# rubocop:disable all
describe Git::API do
  subject do
    obj = Object.new
    obj.extend(Git::API)
  end
  let(:git) { Git::Core }

  describe "#create_repo" do
    let(:repos) { Git::Core.repositories }
    it { expect { subject.create_repo(name: :name) }.to change { repos.count }.by(1) }
  end

  describe "#create_pull_request" do
    it { expect(subject.create_pull_request(title: :title)).to be_kind_of(Git::PullRequest) }
  end

  describe "#create_commit" do
    it { expect(subject.create_commit(title: :title, body: :body)).to be_kind_of(Git::Commit) }
  end
end
# rubocop:enable all
