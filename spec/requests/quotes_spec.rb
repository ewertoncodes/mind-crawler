require 'rails_helper'

RSpec.describe 'Quotes', type: :request do
  let(:user) { create :user }
  let(:headers) { authenticated_header(user) }

  context 'when the user is logged in' do
    describe 'GET /quotes/:tag' do 
      context 'when the record exists' do
        it "returns status code 200" do
          tag = "inspirational"
          get "/quotes/#{tag}", headers: headers

          expect(response).to have_http_status(:success)
        end
      end
  
      context 'when the record does not exist' do
        it "returns status code 404" do
          tag = "wrong"
          
          get "/quotes/#{tag}", headers: headers
          
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
  
  context 'when the user is not logged in ' do
    describe 'GET /quotes/:tag' do 
      context 'when the record exists' do
        it "returns status code 200" do
          tag = "inspirational"
          
          get "/quotes/#{tag}"
          
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end