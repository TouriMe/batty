require 'rails_helper'

RSpec.describe "guides/edit", type: :view do
  before(:each) do
    @guide = assign(:guide, Guide.create!())
  end

  it "renders the edit guide form" do
    render

    assert_select "form[action=?][method=?]", guide_path(@guide), "post" do
    end
  end
end
