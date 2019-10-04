require 'spec_helper'

RSpec.describe Vpr::Url do
  let(:commit) { '30bd60' }

  describe '.home_url' do
    subject { described_class.home_url }

    it 'returns the project url' do
      url = %r{https://github.com/\w+/vpr}
      expect(subject).to match(url)
    end
  end

  describe '.pulls_url' do
    subject { described_class.pulls_url }

    it 'returns the pull requests url' do
      url = %r{https://github.com/\w+/vpr/pulls}
      expect(subject).to match(url)
    end
  end

  describe '.issues_url' do
    subject { described_class.issues_url }

    it 'returns the  issues url' do
      url = %r{https://github.com/\w+/vpr/issues}
      expect(subject).to match(url)
    end
  end

  describe '.issues_url' do
    subject { described_class.branches_url }

    it 'returns the  issues url' do
      url = %r{https://github.com/\w+/vpr/branches}
      expect(subject).to match(url)
    end
  end

  describe '.branch_url' do
    subject { described_class.branch_url }

    it 'returns the branch url' do
      url = %r{https://github.com/\w+/vpr/tree/\w+}
      expect(subject).to match(url)
    end
  end

  describe '.pull_url' do
    subject { described_class.pull_url }

    it 'returns the current branch pull request url' do
      url = %r{https://github.com/\w+/vpr/pull/\w+}
      expect(subject).to match(url)
    end
  end

  describe '.commit_url' do
    subject { described_class.commit_url(commit) }

    context 'when github' do
      it 'returns the commit url' do
        url = %r{https://github.com/\w+/vpr/commit/30bd60}
        expect(subject).to match(url)
      end
    end

    context 'when bitbucket' do
      it 'returns the commit url' do
        url = %r{https://bitbucket.org/\w+/vpr/commits/30bd60}
        expect(Vpr::GitParser).to receive(:host).and_return('bitbucket.org')
        expect(Vpr::GitParser).to receive(:repo_url).and_return('https://bitbucket.org/JuanCrg90/vpr')
        expect(subject).to match(url)
      end
    end
  end

  describe '.search_url' do
    subject { described_class.search_url(commit) }

    it 'returns the search page url' do
      url = %r{https://github.com/\w+/vpr/search\?q=30bd60}
      expect(subject).to match(url)
    end
  end
end
