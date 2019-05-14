describe Git::Repository do
  let(:author) { double(Object.new, notifications: []) }

  let(:params) do
    {
      author: author,
      name: :name
    }
  end
  subject { described_class.new(params) }

  describe 'has an name' do
    it { expect(subject.name).to eq(:name) }
  end

  describe 'has a author' do
    it { expect(subject.author).to eq(author) }
  end

  describe 'has array of commits' do
    it { expect(subject.commits).to eq [] }
  end

  describe 'has an array of pull_reqests' do
    it { expect(subject.pull_reqests).to eq [] }
  end

  describe '#new_pull_reqests' do
    it { expect(subject.new_pull_reqests).to eq [] }
  end

  describe '#add_pull_reqest' do
    let(:plrq_author) { double(Object.new, notifications: []) }
    let(:pull_reqest) { instance_double(Git::PullRequest, author: plrq_author, title: :title) }
    it { expect { subject.add_pull_reqest(pull_reqest) }.to change { subject.pull_reqests }.to([pull_reqest]) }
    it { expect { subject.add_pull_reqest(pull_reqest) }.to change { author.notifications.count }.by(1) }
  end
end
