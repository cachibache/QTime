module StatementsHelper
  
  def correct?
    @last_voted.true_or_false == @vote.vote ? 'Correct!' : 'Incorrect!'
  end

  def last_statement?
    if @next_statement == nil
      'There are no statements left to vote on.  See your results on the left.'
    else
      link_to "Next Statement", statement_path(@next_statement), class: "next btn-small", remote: true
    end
  end
end
