require 'rails_helper'
require 'cancan/matchers'

RSpec.describe 'Ability', type: :contoller do
  let!(:post) { Post.new }

  describe 'abilities for admin' do
    before(:each) do
      Role.create(id: 1, name: 'admin')
      @user = create(:user, role_id: 1)
      @ability = Ability.new(@user)
    end

    it 'admin can destroy post' do
      expect(@ability).to be_able_to(:destroy, :post)
    end

    it 'admin can create new post' do
      expect(@ability).to be_able_to(:create, :post)
    end

    it 'admin can edit post' do
      expect(@ability).to be_able_to(:edit, :post)
    end
  end

  describe 'abilities for guest' do
    before(:each) do
      @user = create(:user)
      @ability = Ability.new(@user)
    end

    it 'guest cannot destroy post' do
      expect(@ability).not_to be_able_to(:destroy, :post)
    end

    it 'guest cannot create new post' do
      expect(@ability).not_to be_able_to(:create, :post)
    end

    it 'guest cannot edit post' do
      expect(@ability).not_to be_able_to(:edit, :post)
    end
  end
end
