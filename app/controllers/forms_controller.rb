class FormsController < ApplicationController
  def index
    @forms = Form.all
  end

  def show
    @form = Form.find(params[:id])
    @questions = @form.questions
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)

    # TODO: Will improve once we implement login functionality
    @form.user = User.first

    if @form.save
      redirect_to @form, notice: "Form was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @form = Form.find(params[:id])
  end

  def update
    @form = Form.find(params[:id])
    if @form.update(form_params)
      redirect_to @form, notice: "Form was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    redirect_to forms_path, notice: "Form deleted."
  end
end

private

def form_params
  params.require(:form).permit(:title)
end
