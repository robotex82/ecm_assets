require 'spec_helper'

describe Post::Image do
  context 'paperclip' do
    it { should have_attached_file :attachment }
  end

  context 'validations' do
    it { should validate_attachment_presence :attachment }
  end
end
