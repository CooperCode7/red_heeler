require "test_helper"

class FormTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(email: "test@example.com")
  end

  test "should save valid form" do
    form = Form.new(title: "Test form", user: @user)
    assert form.save, "Failed to save a valid form"
  end

  test "should not save form without title" do
    form = Form.new(title: "No User Form")
    assert_not form.save, "Saved the form without a user"
  end

  test "should not save form without user" do
    form = Form.new(title: "No User Form")
    assert_not form.save, "Saved the form without a user"
  end

  test "should have many questions" do
    form = Form.create!(title: "With Questions", user: @user)
    form.questions.create!(content: "Question 1")
    form.questions.create!(content: "Question 2")
    assert_equal 2, form.questions.count
  end
end
