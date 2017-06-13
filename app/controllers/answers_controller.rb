class AnswersController < ApplicationController

   def new
      @question = Question.find(params[:question_id])
      @answer = @question.answers.build
   end

   def create
     @question = Question.find(params[:question_id])
     @answer = @question.answers.create(answer_params)
     @answer.user_id = current_user.id

     if @answer.save
      redirect_to question_path(@question)
     else
      redirect_to root_path
    end
   end



   def edit
     @question = Question.find(params[:question_id])
     @answer = @question.answers.find(params[:id])
   end

   def update
     @question = Question.find(params[:question_id])
     @answer = @question.answers.find(params[:id])
     if @answer.update(answer_params)
      redirect_to question_path(@question)
     else
      render 'edit'
     end
   end

    def destroy
     @question = Question.find(params[:question_id])
     @answer = @question.answers.find(params[:id])
     @answer.destroy
     redirect_to question_path(@question)

    end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end


end
