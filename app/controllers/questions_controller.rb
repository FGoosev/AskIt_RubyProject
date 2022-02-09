class QuestionsController < ApplicationController
  #before_action :find_question, only: %i[show destroy update edit]
  def index
    @question = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.ans.build
    @answers = @question.ans.order created_at: :desc
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = 'Question created!'
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update question_params
      flash[:success] = 'Question updated!'
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    if @question.destroy
      flash[:success] = 'Question deleted!'
    end
    redirect_to questions_path
  end

  private def question_params
    params.require(:question).permit(:title, :body)
  end
end