# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cat, type: :model do
  let(:cat) { FactoryBot.build(:cat) }
  it 'is valid with valid attributes' do
    expect(cat).to be_valid
  end
end
