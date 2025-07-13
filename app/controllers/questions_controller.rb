class QuestionsController < ApplicationController
  before_action :set_form
  def new
    @question = @form.questions.build
  end

  def create
    @question = @form.questions.build(question_params)

    if @question.save
      redirect_to form_path(@form), notice: "Question added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @form = Form.find(params[:form_id])
    @question = @form.questions.find(params[:id])
  end

  def update
    @form = Form.find(params[:form_id])
    @question = @form.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to form_path(@form), notice: "Question updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @form = Form.find(params[:form_id])
    @question = @form.questions.find(params[:id])
    @question.destroy
    redirect_to form_path(@form), notice: "Question deleted."
  end

  private

  def set_form
    @form = Form.find(params[:form_id])
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
