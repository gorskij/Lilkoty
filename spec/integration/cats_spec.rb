# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Cats', type: :request do
  before do
    FactoryBot.create_list(:cat, 2)
    FactoryBot.create(:litter, mother: Cat.last, father: Cat.last(2).first)
    FactoryBot.create_list(:cat, 5, status: 'available', litter: Litter.last)
    FactoryBot.create_list(:cat, 5, status: 'our-cat', litter: Litter.last, mother: Cat.last, father: Cat.last)
  end

  after do |example|
    example.metadata[:response][:content] = {
      'application/json' => {
        example: JSON.parse(response.body, symbolize_names: true)
      }
    }
  end

  path '/api/v1/cats/available' do
    get('available cats') do
      tags 'Cats'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/cats/from_our_breeding' do
    get('from_our_breeding cats') do
      tags 'Cats'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
