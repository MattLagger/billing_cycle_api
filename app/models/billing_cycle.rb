class BillingCycle < ApplicationRecord
    has_many :debts
    has_many :credits
end
