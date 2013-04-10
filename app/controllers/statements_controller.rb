class StatementsController < ApplicationController
  
  def index
    @statement = Statement.all
  end

  def new
    @statement = Statement.new
  end

  def create
    @statement = Statement.new(params[:statement])
    @statement.true_or_false == true ? @statement.no_true += 1 : @statement.no_false += 1
    if @statement.save
      redirect_to statements_path
    else
      render :new
    end
  end

  def show
    @statement = Statement.find(params[:id])
  end

  def edit
    @statement = Statement.find(params[:id])
  end

  def update
    if @statement.update_attributes(params[:statement])
      redirect_to statements_path
    else
      render :edit
    end
  end

  def destroy
  end

  # def vote_true
  #   @statement
  #   debugger
  #   @statement.no_true += 1
  # end

end
