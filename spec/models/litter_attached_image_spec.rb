# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LitterAttachedImage, type: :model do
  let(:litter_attached_image) { FactoryBot.build(:litter_attached_image) }
  it 'is valid with valid attributes' do
    expect(litter_attached_image).to be_valid
  end
end
