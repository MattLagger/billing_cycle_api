class Debt < ApplicationRecord
    belongs_to :billing_cycle

    enum status: [:PAGO, :PENDENTE, :AGENDADO]
end
