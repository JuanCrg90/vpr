require 'spec_helper'

RSpec.describe Vpr::GitParser do
  describe '.repo_url' do
    it 'returns the repo url' do
      expect(described_class.repo_url).to eq('https://github.com/JuanCrg90/vpr')
    end
  end

  describe 'current_branch' do
    it 'returns the current git branch' do
      expect(described_class.current_branch).to match(/\w+/)
    end
  end
end
