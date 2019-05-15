# rubocop:disable all
describe Git::Core do
  subject { Git::Core }
  let(:user) { Object.new }

  describe "has an array of repositories" do
    it { expect(subject.repositories).to be_kind_of Array }
  end

  describe "repositories" do
    let(:repo) { instance_double(Git::Repository, name: "name") }
    after(:each) { subject.repositories.clear } # 🤔 clearing doubles

    describe ".add_repo" do
      context "Repository Already Exists" do
        it do
          "Raises Git::RepositoryNameAlreadyTaken"
          subject.add_repo(repo)
          expect { subject.add_repo(repo) }.to raise_error Git::RepositoryNameAlreadyTaken
        end
      end

      it { expect { subject.add_repo(repo) }.to change { subject.repositories.count }.by(1) }
    end

    describe ".find_repo" do
      let(:wrong_repo) { instance_double(Git::Repository, name: :wrong_repo) }

      before(:each) { subject.add_repo(repo) }

      context "Repository Not Found" do
        it { expect { subject.find_repo(:wrong_repo) }.to raise_error Git::RepositoryNotFound }
      end

      context "Repository Found" do
        it { expect(subject.find_repo(repo)).to eq(repo) }
      end
    end

    describe ".repo_name_exist?" do
      let(:wrong_name) { "Some name" }

      before(:each) { subject.add_repo(repo) }

      context "Repository Not Found" do
        it { expect(subject.repo_name_exist?(:wrong_name)).to eq false }
      end

      context "Repository Found" do
        it { expect(subject.repo_name_exist?(repo.name)).to eq true }
      end
    end
  end
end
# rubocop:enable all
