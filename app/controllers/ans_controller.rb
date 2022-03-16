class AnsController < ApplicationController

  def create
    @question = Question.find params[:question_id]
    @answer = @question.ans.build answer_params
    if @answer.save
      flash[:success] = 'Question created!'
      redirect_to question_path(@question)
    else
      @answers = @question.ans.order created_at: :desc
      render "questions/show"
    end
  end

  def destroy
    @question = Question.find params[:question_id]
    @answer = @question.ans.find params[:id]
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to question_path(@question)
  end

  def edit
    @question = Question.find params[:question_id]
    @answer = @question.ans.find params[:id]
  end

  def update
    @question = Question.find params[:question_id]
    @answer = @question.ans.find params[:id]
    if @answer.update answer_params
      flash[:success] = 'Answer updated!'
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  private def answer_params
    params.require(:an).permit(:body)
  end
end
