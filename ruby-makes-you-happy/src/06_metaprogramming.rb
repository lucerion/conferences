#!/usr/bin/env ruby

class Payment
  STATUSES = ['pending', 'processed', 'cancelled']

  attr_reader :status

  def initialize(status)
    @status = status
  end

  STATUSES.each do |payment_status|
    define_method "#{payment_status}?" do
      payment_status == status
    end
  end
end

payment = Payment.new('pending')
p payment.processed?
p payment.pending?
