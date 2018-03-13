class Debt < ApplicationRecord
    belongs_to :billingCycle

    enum status: [:PAGO, :PENDENTE, :AGENDADO]
end
