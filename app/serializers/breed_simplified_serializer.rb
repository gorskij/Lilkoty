# frozen_string_literal: true

class BreedSimplifiedSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name
end
