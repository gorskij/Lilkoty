# frozen_string_literal: true

describe 'PickRelevant' do
  before do
    FactoryBot.create_list(:news, 20)
    FactoryBot.create(:news)
    FactoryBot.create(:config)
  end

  let(:invalid_args) { ['invalid_arg', -1, 0, 9.5] }

  context 'without argument' do
    it 'return default amount of news' do
      expect(NewsService::PickRelevant.call.count).to eq(Config.relevant_news_limit)
    end
  end

  context 'with valid argument' do
    it 'return expected amount of news' do
      expect(NewsService::PickRelevant.call(news_limit: 3).count).to eq(3)
    end
  end

  context 'with invalid argument' do
    it 'return default amount of news' do
      invalid_args.map do |invalid_arg|
        expect(NewsService::PickRelevant.call(news_limit: invalid_arg).count).to eq(Config.relevant_news_limit)
      end
    end
  end
end
