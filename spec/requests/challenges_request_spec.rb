# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Challenges', type: :request do
  describe 'POST /challenge1' do
    let(:headers) do
      {
        "ACCEPT" => "application/json",
        "HTTP_ACCEPT" => "application/json"
      }
    end
    let(:mock_file) { fixture_file_upload('challenge1_mock.txt') }
    let(:params) { { mass_file: { data: mock_file }} }
    let(:expected_value) { 33583 + 654 + 2 +2 }
    let(:expected_body) do
      {
        result: {
          value: expected_value
        }
      }.to_json
    end

    it 'returns the expected result' do
      post '/challenge1', params: params, headers: headers
      expect(response).to have_http_status(:success)
      expect(response.body).to eq expected_body
    end
  end
end
