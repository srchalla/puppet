require 'spec_helper'
describe 'puppet_vim' do

  context 'with default values for all parameters' do
    it { should contain_class('puppet_vim') }
  end
end
