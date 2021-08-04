# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CatAttachedImage, type: :model do
  let(:cat_attached_image) { FactoryBot.build(:cat_attached_image) }

  it 'is valid with valid attributes' do
    expect(cat_attached_image).to be_valid
  end
end
