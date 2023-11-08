# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::UsersController, type: :controller do
  let(:user) { create :user}
  before do
    sign_in user
  end
  describe 'Get Index' do
   
    it 'asssign user in @users' do
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe '#edit ' do
    it 'render :edit' do
      get :edit, params: {
        id: user.id
      }
      expect(response).to render_template(:edit)
    end
  end
end
