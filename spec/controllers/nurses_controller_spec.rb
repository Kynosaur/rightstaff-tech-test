require 'rails_helper'

RSpec.describe NursesController, type: :controller do
  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'returns a list of nurses' do
      role = Role.create({name: 'test_role'})
      nurse = Nurse.create({email: 'test@test.com', first_name: 'test', last_name: 'test', role: role})
      get :index
      expect(assigns(:nurses)).to eq([nurse])
    end
  end
end
