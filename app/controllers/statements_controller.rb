class StatementsController < ApplicationController
  
  def index
    @statement = Statement.all
  end

  def new
    @statement = Statement.new
  end

  def create
    @statement = Statement.new(params[:statement])
    if @statement.save
      redirect_to statements_path
    else
      render :new
    end
  end

end
