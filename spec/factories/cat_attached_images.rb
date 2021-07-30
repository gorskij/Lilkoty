# frozen_string_literal: true

FactoryBot.define do
  factory :cat_attached_image do
    cat_id { create(:cat).id }
    image { Rack::Test::UploadedFile.new('spec/factories/testst.png', 'testst/png') }
    date { '2018-02-03' }
  end
end
