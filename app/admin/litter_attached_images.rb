# frozen_string_literal: true

ActiveAdmin.register LitterAttachedImage do
  menu priority: 5

  permit_params :litter_id, :image, :role

  includes image_attachment: :blob

  form html: { multipart: true } do |f|
    f.semantic_errors
    f.inputs
    f.input :image, as: :file
    f.actions
  end
end
