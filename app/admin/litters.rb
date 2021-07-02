# frozen_string_literal: true

ActiveAdmin.register Litter do
  menu priority: 2
  permit_params :name, :mother_id, :father_id, :date_of_creation
  includes :mother, :father
end
