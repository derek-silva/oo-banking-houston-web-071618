
class Transfer

  attr_reader :receiver, :sender, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.sender.status = "open"
        if status != "complete" && sender.balance >= amount && self.sender.status == "open"
          self.sender.balance -= amount
          self.receiver.balance += amount
          @status = "complete"
        else
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
      else
        @status = "rejected"
      end
    end

    def reverse_transfer
      if @status == "complete"
        self.sender.balance += amount
        self.receiver.balance -= amount
        @status = "reversed"
      end
    end


end
