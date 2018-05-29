require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  let!(:categories) { create_list(:category, 10) }
  let(:category_id) { categories.first.id }
  let(:category_name) { categories.first.name }

  describe 'GET /api/v1/categories' do
    before { get '/api/v1/categories' }

    it 'returns categories' do
      expect(json).to be_kind_of(Array)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/categories/:id' do
    before { get "/api/v1/categories/#{category_id}" }

    context 'when the record exists' do
      it 'returns the category' do
        expect(json).not_to be_empty
        expect(json['category']).to eq(category_name)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
