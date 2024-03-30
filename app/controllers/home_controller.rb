class HomeController < ActionController::Base
  layout "application"

  def index
    @transaction = Transaction.new

    @last_months_transactions = Transaction.where(created_at: (Time.now.beginning_of_month - 1.month)..(Time.now.beginning_of_month - 1.second))

    @this_months_transactions = Transaction.where(created_at: Time.now.beginning_of_month..Time.now)

  end
end
