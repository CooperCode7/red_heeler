require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: "test@example.com")
    @form = Form.create!(title: "Test Form", user: @user)
  end

  test "should create question" do
    assert_difference("Question.count", 1) do
      post form_questions_path(@form), params: {
        question: { content: "What is your name?" }
      }
    end

    assert_redirected_to form_path(@form)
  end

  test "should not create question with blank content" do
    assert_no_difference("Question.count") do
      post form_questions_path(@form), params: {
        question: { content: "" }
      }
    end

    assert_response :unprocessable_entity
    decoded_body = CGI.unescapeHTML(response.body)
    assert_match(/can't be blank/, decoded_body)
  end

  test "should delete question" do
    question = @form.questions.create!(content: "Delete me")

    assert_difference("Question.count", -1) do
      delete form_question_path(@form, question)
    end

    assert_redirected_to form_path(@form)
  end

  test "should get edit" do
    question = @form.questions.create!(content: "Edit me")
    get edit_form_question_path(@form, question)
    assert_response :success
  end
end
