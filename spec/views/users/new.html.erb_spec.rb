require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :encrypted_password => "MyString",
      :encrypted_password_salt => "MyString",
      :encrypted_password_iv => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_encrypted_password[name=?]", "user[encrypted_password]"

      assert_select "input#user_encrypted_password_salt[name=?]", "user[encrypted_password_salt]"

      assert_select "input#user_encrypted_password_iv[name=?]", "user[encrypted_password_iv]"

      assert_select "input#user_name[name=?]", "user[name]"
    end
  end
end
