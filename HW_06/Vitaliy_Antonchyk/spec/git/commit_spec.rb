describe Git::Commit do
  let(:params) do
    {
      body: :body,
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

  describe 'has a body' do
    it { expect(subject.body).to eq(:body) }
  end
end
