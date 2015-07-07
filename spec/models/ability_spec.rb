require 'rails_helper'
require 'cancan/matchers'

RSpec.describe 'Ability', type: :contoller do
  let!(:post) { Post.new }
  let(:subject) { Ability.new(user) }

  describe 'abilities for admin' do
    let(:user) { create(:user, role_id: 1) }

    it { is_expected.to be_able_to(:destroy, :post) }
    it { is_expected.to be_able_to(:create, :post) }
    it { is_expected.to be_able_to(:edit, :post) }
  end

  describe 'abilities for guest' do
    let(:user) { create(:user) }

    it { is_expected.not_to be_able_to(:destroy, :post) }
    it { is_expected.not_to be_able_to(:create, :post) }
    it { is_expected.not_to be_able_to(:edit, :post) }
  end
end
