# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::UsersController, type: :controller do
  describe 'Get Index' do
    let(:user) { create :user }
    it 'asssign_in(user)ign @users' do
      get :index
      expect(assigns(:users)) == ([user])
    end
  end

  describe '#edit ' do
    let(:user) { create :user }
    it 'render :edit' do
      sign_in user
      get :edit, params: {
        id: user.id
      }
      expect(response).to render_template(:edit)
    end
  end
end
