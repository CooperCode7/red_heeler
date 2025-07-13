require "test_helper"

class FormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: "test@example.com")
    @form = Form.create!(title: "Sample Form", user: @user)
  end

  test "should get index" do
    get forms_url
    assert_response :success
    assert_select "h1", "All Forms"
  end

  test "should show form" do
    get form_url(@form)
    assert_response :success
    assert_select "h1", @form.title
  end

  test "should get new" do
    get new_form_url
    assert_response :success
  end

  test "should create form" do
    assert_difference("Form.count", 1) do
      post forms_url, params: { form: { title: "New Form", user_id: @user.id } }
    end
    assert_redirected_to form_path(Form.last)
  end

  test "should not create form without title" do
    assert_no_difference("Form.count") do
      post forms_url, params: { form: { title: "", user_id: @user.id } }
    end
    assert_response :unprocessable_entity
    assert_select "div#error_explanation"
  end

  test "should get edit" do
    get edit_form_url(@form)
    assert_response :success
  end

  test "should update form" do
    patch form_url(@form), params: { form: { title: "Updated Title" } }
    assert_redirected_to form_path(@form)
    @form.reload
    assert_equal "Updated Title", @form.title
  end

  test "should destroy form" do
    assert_difference("Form.count", -1) do
      delete form_url(@form)
    end
    assert_redirected_to forms_url
  end
end
