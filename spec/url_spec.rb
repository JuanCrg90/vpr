require 'spec_helper'

RSpec.describe Vpr::Url do
  let(:commit) { '30bd60' }

  describe '.home_url' do
    subject { described_class.home_url }

    it 'returns the project url' do
      expect(subject).to eq('https://github.com/JuanCrg90/vpr')
    end
  end

  describe '.pulls_url' do
    subject { described_class.pulls_url }

    it 'returns the pull requests url' do
      expect(subject).to eq('https://github.com/JuanCrg90/vpr/pulls')
    end
  end

  describe '.issues_url' do
    subject { described_class.issues_url }

    it 'returns the  issues url' do
      expect(subject).to eq('https://github.com/JuanCrg90/vpr/issues')
    end
  end

  describe '.branch_url' do
    subject { described_class.branch_url }

    it 'returns the branch url' do
      expect(subject).to match(%r{https://github.com/JuanCrg90/vpr/tree/\w+})
    end
  end

  describe '.pull_url' do
    subject { described_class.pull_url }

    it 'returns the current branch pull request url' do
      expect(subject).to match(%r{https://github.com/JuanCrg90/vpr/pull/\w+})
    end
  end

  describe '.commit_url' do
    subject { described_class.commit_url(commit) }

    it 'returns the commit url' do
      expect(subject).to eq('https://github.com/JuanCrg90/vpr/commit/30bd60')
    end
  end

  describe '.search_url' do
    subject { described_class.search_url(commit) }

    it 'returns the search page url' do
      expect(subject).to eq('https://github.com/JuanCrg90/vpr/search?q=30bd60')
    end
  end
end
