# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Cats API', type: :request do
  let!(:cats) { FactoryBot.create_list(:cat, 5) }
  let!(:available_cats) { FactoryBot.create_list(:cat, 5, status: 'available') }
  let(:id) { cats.last.id }

  after do |example|
    example.metadata[:response][:content] = {
      'application/json' => {
        example: JSON.parse(response.body, symbolize_names: true)
      }
    }
  end

  path '/api/v1/cats/index' do
    get('list cats') do
      tags 'Cats'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/cats/show/{id}' do
    get('show cat') do
      tags 'Cats'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, required: true
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/cats/available' do
    get('available cat') do
      tags 'Cats'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
