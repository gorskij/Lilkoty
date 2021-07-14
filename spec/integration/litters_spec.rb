# frozen_string_literal: true

require 'swagger_helper'

describe 'Litters API' do
  let!(:litters) { FactoryBot.create_list(:litter, 5) }
  let(:id) { litters.last.id }

  after do |example|
    example.metadata[:response][:content] = {
      'application/json' => {
        example: JSON.parse(response.body, symbolize_names: true)
      }
    }
  end

  path '/api/v1/litters/index' do
    get('list litters') do
      tags 'Litters'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/litters/show/{id}' do
    get('show litter') do
      tags 'Litters'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, required: true
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
