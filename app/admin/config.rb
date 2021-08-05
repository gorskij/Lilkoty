# frozen_string_literal: true

ActiveAdmin.register Config do
  menu priority: 7

  permit_params :pinned_news_id, :relevant_news_limit
  actions :all, except: %i[destroy new]
  form do |f|
    inputs 'Details' do
      f.semantic_errors
      f.input :pinned_news_id, as: :select, collection: News.all
      f.input :relevant_news_limit
      f.actions
    end
  end

  show do |_t|
    attributes_table do
      row :pinned_news_id
      row :relevant_news_limit
    end
  end
end
