module StatementsHelper
  
  def correct?
    @last_voted.true_or_false == @vote.vote ? 'Correct!' : 'Incorrect!'
  end
end
