# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    title { 'title' }
    content { 'content' }
    video_url { 'video_url' }
    date { Time.zone.today }
    image { Rack::Test::UploadedFile.new('spec/factories/testst.png', 'testst/png') }
  end
end
