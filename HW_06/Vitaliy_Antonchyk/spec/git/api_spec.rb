describe Git::API do
  subject do
    obj = Object.new
    obj.extend(Git::API)
    obj.extend(Notifications)
  end
  let(:git) { Git::Core }

  describe '#create_repo' do
    it { expect(subject.create_repo(name: :name)).to be_instancde_of(Git::Repository) }
  end
end
