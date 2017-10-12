require 'spec_helper'
describe 'rvim' do
  context 'with default values for all parameters' do
    it { should contain_class('rvim') }
  end
end
