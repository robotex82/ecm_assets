require 'spec_helper'

describe Site do
  context 'associations' do
    it { should have_one :logo }
  end

  context 'validations' do
    it { should validate_presence_of :name }
  end
end
