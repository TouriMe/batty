require 'rails_helper'

RSpec.describe "guides/show", type: :view do
  before(:each) do
    @guide = assign(:guide, Guide.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
