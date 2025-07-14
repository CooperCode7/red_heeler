require "test_helper"

class AnswerChoiceTest < ActiveSupport::TestCase
  def setup
    @question = Question.create!(content: "Sample question?", form: Form.first)
  end

  test "should be valid with option and question" do
    answer_choice = AnswerChoice.new(option: "True", question: @question)
    assert answer_choice.valid?
  end

  test "should be invalid without option" do
    answer_choice = AnswerChoice.new(option: "", question: @question)
    assert_not answer_choice.valid?
    assert_includes answer_choice.errors[:option], "can't be blank"
  end

  test "should be invalid without question" do
    answer_choice = AnswerChoice.new(option: "Maybe")
    assert_not answer_choice.valid?
    assert_includes answer_choice.errors[:question], "must exist"
  end

  test "position is optional" do
    answer_choice = AnswerChoice.new(option: "False", question: @question)
    assert answer_choice.position.nil?
    assert answer_choice.valid?
  end

  test "should belong to question" do
    assoc = AnswerChoice.reflect_on_association(:question)
    assert_equal :belongs_to, assoc.macro
  end

  test "should be invalid if position is not a number" do
    answer_choice = AnswerChoice.new(option: "Maybe", position: "not_a_number", question: questions(:one))
    assert_not answer_choice.valid?
    assert_includes answer_choice.errors[:position], "is not a number"
  end

  test "should be valid if position is nil" do
    answer_choice = AnswerChoice.new(option: "Maybe", position: nil, question: questions(:one))
    assert answer_choice.valid?
  end
end
