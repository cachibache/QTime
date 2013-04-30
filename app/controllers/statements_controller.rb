class StatementsController < ApplicationController
  
  before_filter :authenticate, :except => [:home]

  def index
    @first_unvoted = Statement.find_unvoted(current_user).first
    @last_voted = Statement.find_voted(current_user).last
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
    @statement = Statement.find(params[:id])
    if @statement.delete
      flash[:notice] = 'Your statement has been deleted.'
      redirect_to statements_path
    else
      flash[:notice] = 'Not deleted. Please try again!'
      redirect_to statements_path
    end
  end

  def vote_true
    @statement = Statement.find(params[:id])
    vote = current_user.vote_exclusively_for(@statement)
    @last_voted = Statement.find_voted(current_user).last
    respond_to do |format|
      format.html { redirect_to statements_path }
      format.js
    end
    vote
  end

  def vote_false
    @statement = Statement.find(params[:id])
    vote = current_user.vote_exclusively_against(@statement)
    @last_voted = Statement.find_voted(current_user).last
    respond_to do |format|
      format.html { redirect_to statements_path }
      format.js
    end
    vote
  end
end
