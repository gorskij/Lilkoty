# frozen_string_literal: true

require 'rails_helper'

RSpec.describe News, type: :model do
  let(:news) { FactoryBot.build(:news) }

  it 'is valid with valid attributes' do
    expect(news).to be_valid
  end
end
