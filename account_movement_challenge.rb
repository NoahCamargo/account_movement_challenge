require 'csv'

class AccountMovementChallenge
  RATE = 300

  attr_accessor :accounts, :account_path, :transaction_path

  def initialize account_path, transaction_path
    self.account_path, self.transaction_path = account_path, transaction_path

    self.accounts = {}

    CSV.foreach(account_path) do |row|
      account, balance = row

      accounts[account] = balance.to_i
    end
  end

  def run_transactions! formatter_value = false
    CSV.foreach(transaction_path) do |row|
      account, transaction = row

      transaction!(account, transaction.to_i)
    end

    puts accounts.map { |key, value| "#{key},#{value}" }

    accounts
  end

  private

  def transaction! account, value
    balance = accounts[account] + value

    return accounts[account] = balance - RATE if value < 0 && balance < 0

    accounts[account] = balance
  end
end