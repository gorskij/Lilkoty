# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'News', type: :request do
  before do
    FactoryBot.create(:config)
    FactoryBot.create_list(:news, 5)
  end

  let(:news_limit) { 3 }

  after do |example|
    example.metadata[:response][:content] = {
      'application/json' => {
        example: JSON.parse(response.body, symbolize_names: true)
      }
    }
  end

  path '/api/v1/news/index' do
    get('list news') do
      tags 'News'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/news/relevant?news_limit={news_limit}' do
    get('relevant news') do
      tags 'News'
      produces 'application/json'
      parameter name: :news_limit, in: :path, type: :integer, required: true
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
