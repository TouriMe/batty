require 'rails_helper'

RSpec.describe "guides/index", type: :view do
  before(:each) do
    assign(:guides, [
      Guide.create!(),
      Guide.create!()
    ])
  end

  it "renders a list of guides" do
    render
  end
end
