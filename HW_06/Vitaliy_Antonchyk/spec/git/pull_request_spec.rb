describe Git::PullRequest do
  let(:params) do
    {
      author: :author,
      title: :title
    }
  end
  subject { described_class.new(params) }

  describe 'has an author' do
    it { expect(subject.author).to eq(:author) }
  end

  describe 'has a title' do
    it { expect(subject.title).to eq(:title) }
  end

  describe 'has array of commits' do
    it { expect(subject.commits).to eq [] }
  end

  describe 'has a status' do
    it { expect(subject.status).to eq 'Open' }
  end

  describe '#merge' do
    it { expect { subject.merge }.to change { subject.status }.to('Merged') }
  end
  describe '#close' do
    it { expect { subject.close }.to change { subject.status }.to('Closed') }
  end

  describe '#add_commits' do
    let(:commits) { instance_double(Git::Commit) }
    it { expect { subject.add_commits(commits) }.to change { subject.commits }.to([commits]) }
  end
end
