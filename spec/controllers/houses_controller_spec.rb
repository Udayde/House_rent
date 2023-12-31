# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HousesController, type: :controller do
  let(:user) { create(:user, email: 'uniq@gmail.com') }
  let(:house) { create(:house) }

  before { sign_in user }
    
  describe '#index' do
    context 'when the user is logged in' do
      it 'assigns @houses' do
        get :index
        expect(assigns(:houses)).to match_array([house])
      end
    end

    context 'when the user is not logged in' do
      before  {sign_out user}
      it 'does not assign @houses' do
        get :index
        expect(assigns(:houses)).to be_nil
      end
    end
  end

  describe '#create' do
    before do 
      post :create, params: {
        house: {
  
          desription: '1bhk',
          location: 'indore',
          buying_price: 1400,
          rental_price: 1500,
          user_id: user.id,
          sold: false,
          available_for: 'buy'
        }
      }
    end
    
    it 'redirect to @houses' do
      expect(response).to redirect_to(houses_path)
    end

    it "check for flash message" do
      expect(flash[:notice]).to_not be_nil
    end

  end

  describe '#new' do
    it 'render :new' do
      get :new, params: {
        house: {

          desription: '1bhk',
          location: 'indore',
          buying_price: 1400,
          rental_price: 1500,
          user_id: user.id,
          sold: false,
          available_for: 'buy'
        }
      }
      expect(response).to render_template('houses/new')
    end
  end

  describe '#edit' do
    it 'render :edit' do
      get :edit, params: { id: house.id }

      expect(response).to render_template('houses/edit')
    end
  end

  describe '#show' do
    it 'render :show' do
      get :show, params: { id: house.id }

      expect(response).to render_template('houses/show')
    end
  end

  describe '#delete' do
    it 'render :delete' do
      delete :destroy, params: { id: house.id }

      expect(response).to redirect_to(houses_path)
    end
  end

  describe '#update' do
    it 'updates the house and redirects houses_path' do
      patch :update, params: {
        id: house.id,
        house: {
          desription: '1bhk',
          location: 'indore',
          buying_price: 1400,
          rental_price: 1500,
          user_id: user.id,
          sold: false,
          available_for: 'buy'
        }
      }
      expect(response).to redirect_to(houses_path)
    end
  end
end
