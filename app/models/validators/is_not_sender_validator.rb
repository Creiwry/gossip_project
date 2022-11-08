# frozen_string_literal: true

# IsNotOwner custom validator
class IsNotSender < ActiveModel::Validator
  def validate(record)
    return unless record.sender_id == record.recipient_id

    record.errors.add :base, 'The sender cannot be the recipient'
  end
end
