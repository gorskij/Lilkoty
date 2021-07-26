# frozen_string_literal: true

FactoryBot.define do
  factory :breed do
    name { 'breed_name' }
    history { 'history' }
    physical_attributes { 'physical_attributes' }
    allergy_informations { 'allergy_informations' }
    image { Rack::Test::UploadedFile.new('spec/factories/testst.png', 'testst/png') }
  end
end
