describe Git::Core do
  subject { Git::Core }
  let(:user) { Object.new }

  describe 'has array of users' do
    it { expect(subject.users).to eq([]) }
  end

  describe 'has an array of repositories' do
    it { expect(subject.repositories).to eq([]) }
  end

  describe '.register_user' do
    it 'includes Git::API in object' do
      subject.register_user(user)
      expect(user.is_a?(Git::API)).to be_truthy
    end
    it { expect { subject.register_user(user) }.to change { subject.users.count }.by(1) }

    context 'user already exist' do
      it do
        subject.register_user(user)
        expect { subject.register_user(user) }.to raise_error Git::UserAlreadyExists
      end
    end
  end

  describe 'repositories' do
    after(:each) { subject.repositories.pop(100) } # 🤔

    describe '.add_repo' do
      let(:repo) { instance_double(Git::Repository, name: :name) }

      context 'Repository Already Exists' do
        it do
          subject.add_repo(repo)
          expect { subject.add_repo(repo) }.to raise_error Git::RepositoryAlreadyExists
        end
      end

      it { expect { subject.add_repo(repo) }.to change { subject.repositories.count }.by(1) }
    end

    describe '.find_repo' do
      let(:repo) { instance_double(Git::Repository, name: :name) }
      context 'Repository Not Found' do
        it { expect { subject.find_repo(repo) }.to raise_error Git::RepositoryNotFound }
      end

      it do
        subject.add_repo(repo)
        expect(subject.find_repo(repo)).to eq(repo)
      end
    end
  end
end
