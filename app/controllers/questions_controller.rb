class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

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

  def edit #GET
    if current_user
    @question = Question.find(params[:id])
    end
  end

  def update #patch
    @question = Question.find(params[:id])
      if @question.update(question_params)
        redirect_to root_path
      else
        redirect_to edit_question_path
      end
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash.now[:danger] = "Question deleted!"
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end
end
