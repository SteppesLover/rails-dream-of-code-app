require 'rails_helper'

RSpec.describe "Trimesters", type: :request do
  describe "PUT /trimesters/:id" do
    let!(:trimester) do
      Trimester.create!(
        term: "Spring",
        year: "2025",
        start_date: Date.today,
        end_date: Date.today + 3.months,
        application_deadline: Date.today + 1.month
      )
    end

    context "when application deadline is valid" do
      it "updates the application deadline and returns status 200" do
        new_deadline = (Date.today + 2.months).to_s

        put "/trimesters/#{trimester.id}", params: {
          trimester: { application_deadline: new_deadline }
        }

        expect(response).to have_http_status(:found)
        expect(trimester.reload.application_deadline.to_s).to eq(new_deadline)
      end
    end

    context "when application deadline is missing" do
      it "returns status 422 (unprocessable_entity)" do
        put "/trimesters/#{trimester.id}", params: {
          trimester: { application_deadline: nil }
        }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when application deadline has invalid format" do
      it "returns status 422 (unprocessable_entity)" do
        put "/trimesters/#{trimester.id}", params: {
          trimester: { application_deadline: "invalid-date" }
        }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when trimester ID does not exist" do
      it "returns status 302 and redirects to index" do
        put "/trimesters/999999", params: {
          trimester: { application_deadline: Date.today.to_s }
        }

        expect(response).to redirect_to(trimesters_path)
        follow_redirect!
        expect(response.body).to include("Trimester not found")
      end
    end
  end
end