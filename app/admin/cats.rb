# frozen_string_literal: true

ActiveAdmin.register Cat do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  menu priority: 1

  permit_params :name, :mother_id, :father_id, :status, :sex, :colour, :breed, :breeding, :litter_id, :date_of_birth,
                :lineage_url

  includes :mother, :father, :litter
end
