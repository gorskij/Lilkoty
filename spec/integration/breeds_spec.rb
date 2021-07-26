# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Breeds API', type: :request do
  let!(:breeds) { FactoryBot.create_list(:breed, 5) }
  let(:id) { breeds.last.id }

  after do |example|
    example.metadata[:response][:content] = {
      'application/json' => {
        example: JSON.parse(response.body, symbolize_names: true)
      }
    }
  end

  path '/api/v1/breeds/index' do
    get('list breeds') do
      tags 'Breeds'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/breeds/show/{id}' do
    get('show breed') do
      tags 'Breed'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, required: true
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
