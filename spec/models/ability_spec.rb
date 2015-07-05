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
      assert @ability.can?(:destroy, :post)
    end

    it 'admin can create new post' do
      assert @ability.can?(:create, :post)
    end

    it 'admin can edit post' do
      assert @ability.can?(:edit, :post)
    end
  end

  describe 'abilities for guest' do
    before(:each) do
      @user = create(:user)
      @ability = Ability.new(@user)
    end

    it 'guest cannot destroy post' do
      assert @ability.cannot?(:destroy, :post)
    end

    it 'guest cannot create new post' do
      assert @ability.cannot?(:create, :post)
    end

    it 'guest cannot edit post' do
      assert @ability.cannot?(:edit, :post)
    end
  end
end
