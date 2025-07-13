require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(email: "test@example.com")
  end

  test "should not save question without content" do
    form = Form.create!(title: "Test Form", user: @user)
    question = form.questions.build(content: "")
    assert_not question.save, "Saved the question without content"
  end
end
