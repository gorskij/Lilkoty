# frozen_string_literal: true

FactoryBot.define do
  factory :litter_attached_image do
    litter_id { create(:litter).id }
    image { Rack::Test::UploadedFile.new('spec/factories/testst.png', 'testst/png') }
    role { 'default' }
  end
end
