require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :encrypted_password_salt => "Encrypted Password Salt",
        :encrypted_password_iv => "Encrypted Password Iv",
        :name => "Name"
      ),
      User.create!(
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :encrypted_password_salt => "Encrypted Password Salt",
        :encrypted_password_iv => "Encrypted Password Iv",
        :name => "Name"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Password Salt".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Password Iv".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
