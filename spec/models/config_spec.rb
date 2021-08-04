# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Config, type: :model do
  let(:config) { FactoryBot.build(:cat) }

  it 'is valid with valid attributes' do
    expect(config).to be_valid
  end
end
