# rubocop:disable all

describe Homework do
  let(:author) { double(Object.new, subscribers: []) }

  let(:params) do
    {
      title: :title,
      body: :body,
      author: author,
      target_repo: :target_repo,
    }
  end
  subject { described_class.new(params) }

  describe "has a title" do
    it { expect(subject.title).to eq(:title) }
  end

  describe "has a body" do
    it { expect(subject.body).to eq(:body) }
  end
  describe "has a author" do
    it { expect(subject.author).to eq(author) }
  end
  describe "has a target_repo" do
    it { expect(subject.target_repo).to eq(:target_repo) }
  end

  describe "#to_json" do
    it { expect(subject.to_json).to eq(title: :title, body: :body, student: author) }
  end
end
# rubocop:enable all
