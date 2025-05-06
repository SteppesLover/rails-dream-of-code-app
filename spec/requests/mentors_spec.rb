
require 'rails_helper'

RSpec.describe "Mentors", type: :request do
  describe "GET /mentors" do
    before do
      Mentor.create!(first_name: "Alice", last_name: "Smith")
      Mentor.create!(first_name: "Bob", last_name: "Jones")
    end

    it "shows a name" do
      get "/mentors"
      expect(response.body).to include("Alice")
      expect(response.body).to include("Smith")
    end

    it "displays the list names of all mentors" do
      get "/mentors"
      expect(response.body).to include("Alice")
      expect(response.body).to include("Smith")
      expect(response.body).to include("Bob")
      expect(response.body).to include("Jones")
    end
  end
end