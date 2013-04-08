class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    render :new unless params[:answer].downcase.strip! == 'true' || 'false'
    params[:answer] = params[:answer].downcase.strip!
    @question = Question.new(params[:question])
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

end
