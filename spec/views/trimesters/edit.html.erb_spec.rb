require 'rails_helper'

RSpec.describe "trimesters/edit.html.erb", type: :view do
  before do
    assign(:trimester, Trimester.new(id: 1, application_deadline: Date.today))
  end

  it "displays the application_deadline field" do
    render
    expect(rendered).to include("application_deadline")
  end
end
