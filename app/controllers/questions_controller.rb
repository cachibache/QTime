class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    render :new unless params[:answer].downcase == 'true' || 'false' # must take out whitespace
    params[:answer] = params[:answer].downcase
    @question = Question.new(params[:question])
    if @question.save
      redirect_to new_question_path
    else
      render :new
    end
end
