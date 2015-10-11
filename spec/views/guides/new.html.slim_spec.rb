require 'rails_helper'

RSpec.describe "guides/new", type: :view do
  before(:each) do
    assign(:guide, Guide.new())
  end

  it "renders new guide form" do
    render

    assert_select "form[action=?][method=?]", guides_path, "post" do
    end
  end
end
