require 'spec_helper'

module Ecm::Assets
  describe PlainFile do
    context 'paperclip' do
      it { should have_attached_file :attachment }
    end

    context 'validations' do
      it { should validate_attachment_presence(:attachment) }
    end
  end
end

