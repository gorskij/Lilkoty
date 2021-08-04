class FixDefaultRelevantNewsLimitName < ActiveRecord::Migration[6.1]
  def change
    rename_column :configs, :default_relevant_news_limit, :relevant_news_limit
  end
end
