# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Litter, type: :model do
  let(:litter) { FactoryBot.build(:litter) }

  it 'is valid with valid attributes' do
    expect(litter).to be_valid
  end
end
