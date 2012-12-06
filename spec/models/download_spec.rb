require 'spec_helper'

describe Download do
  context 'associations' do
    it { should have_one :plain_file }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :plain_file }
  end
end
