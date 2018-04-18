require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    User.destroy_all
  end

  let(:simon) {User.create(name: 'Simon', password: 'says')}

  describe 'post create' do
    it 'logs you in with the correct password' do
      post :create, params: {user: {name: simon.name, password: simon.password}}
      expect(session[:user_id]).to eq(simon.id)
    end

    it 'rejects invalid passwords' do
      post :create, params: {user: {name: simon.name, password: simon.password + 'x'}}
      expect(session[:user_id]).to be_nil
    end

    it 'rejects empty passwords' do
      post :create, params: {user: {name: simon.name, password: ''}}
      expect(session[:user_id]).to be_nil
    end
  end
end
