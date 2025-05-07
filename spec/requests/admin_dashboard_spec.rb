require 'rails_helper'

describe 'GET /dashboard' do
  before do
    current_trimester = Trimester.create!(
      term: 'Spring',
      year: Date.today.year.to_s,
      start_date: Date.today - 1.day,
      end_date: Date.today + 2.months,
      application_deadline: Date.today - 16.days
    )
    upcoming_trimester = Trimester.create!(
      term: 'Summer',
      year: Date.today.year.to_s,
      start_date: Date.today + 2.month,
      end_date: Date.today + 5.months,
      application_deadline: Date.today + 50.days
    )

  end
    # Define past_trimester here and uncomment it when you're ready.
    # past_trimester =
    it 'displays the current trimester' do
      get "/dashboard"
      expect(response.body).to include("Spring")
  end

  it 'displays the upcoming trimester' do
    get "/dashboard"
    expect(response.body).to include("Summer")
end
end

RSpec.describe 'Courses', type: :request do
  describe 'GET /courses/:id' do
    it 'displays the student' do
      get "/courses/5"

      expect(response.body).to include('Trevor')
      expect(response.body).to include('Wiza')
    end
  end
end