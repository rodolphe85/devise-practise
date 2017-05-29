class QuestionsController < ApplicationController

  before_action :authenticate_user!

  def new
    @question = Question.new
  end

  def create

    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end
end
