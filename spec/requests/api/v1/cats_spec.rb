# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Cats', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/cats/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/api/v1/cats/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/api/v1/cats/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/api/v1/cats/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
