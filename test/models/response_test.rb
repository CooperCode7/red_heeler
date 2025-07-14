require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(email: "test@example.com")
    @form = Form.create!(title: "Daily Tracker", user: @user)
    @response = Response.create!(user: @user, form: @form)
  end

  test "should not allow creating a second response for same user, form, and day" do
    @response.save!
    duplicate_response = Response.new(user: @user, form: @form)
    assert_not duplicate_response.valid?, "Duplicate response for the same user, form, and day should be invalid"
    assert_includes duplicate_response.errors[:base], "You can only submit one response per form per day"
  end

  test "should allow updating the existing response" do
    @response.save!
    @response.notes = "Updated value"
    assert @response.valid?, "Existing response should be valid to update"
    assert @response.save, "Should save the updated response successfully"
  end

  test "should be valid with user and form" do
    assert @response.valid?
  end

  test "should be invalid without user" do
    response = Response.new(form: @form)
    assert_not response.valid?
    assert_includes response.errors[:user], "must exist"
  end

  test "should be invalid without form" do
    response = Response.new(user: @user)
    assert_not response.valid?
    assert_includes response.errors[:form], "must exist"
  end

  test "responds to user and form" do
    response = Response.new(user: @user, form: @form)
    assert_respond_to response, :user
    assert_respond_to response, :form
  end
end
