class StatementsController < ApplicationController
  
  before_filter :authenticate, :except => [:home]

  def index
    @statements = Statement.find_unvoted(current_user).first
  end

  def new
    @statement = Statement.new
  end

  def create
    @statement = Statement.new(params[:statement])
    if @statement.save
      respond_to do |format|
        format.html { redirect_to statements_path }
        format.js
      end
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
    @statement = Statement.find(params[:id])
    if @statement.update_attributes(params[:statement])
      redirect_to statement_path
    else
      render :edit
    end
  end

  def destroy
  end

  def vote_true
    @statement = Statement.find(params[:id])
    vote = current_user.vote_exclusively_for(@statement)
    redirect_to statements_path
  end

  def vote_false
    @statement = Statement.find(params[:id])
    vote = current_user.vote_exclusively_against(@statement)
    redirect_to statements_path
  end
end
