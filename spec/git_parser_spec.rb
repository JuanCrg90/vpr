require 'spec_helper'

RSpec.describe Vpr::GitParser do
  describe '.repo_url' do
    it 'returns the repo url' do
      expect(described_class.repo_url).to eq('https://github.com/JuanCrg90/vpr')
    end
  end
end
