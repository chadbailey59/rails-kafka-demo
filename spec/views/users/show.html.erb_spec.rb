require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :encrypted_password => "Encrypted Password",
      :encrypted_password_salt => "Encrypted Password Salt",
      :encrypted_password_iv => "Encrypted Password Iv",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Encrypted Password/)
    expect(rendered).to match(/Encrypted Password Salt/)
    expect(rendered).to match(/Encrypted Password Iv/)
    expect(rendered).to match(/Name/)
  end
end
