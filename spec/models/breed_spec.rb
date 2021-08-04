# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Breed, type: :model do
  let(:breed) { FactoryBot.build(:breed) }

  it 'is valid with valid attributes' do
    expect(breed).to be_valid
  end
end
