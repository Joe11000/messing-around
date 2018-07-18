class DesireableValidator < ActiveModel::Validator
  def validate_each record, attribute, value
    return true if record.age < 60 && record.sexuality != 'straight'
    false
  end

  def validate record
    unless record.age > 21 && record.age < 32 && record.sexuality == 'straight'
    end
  end
end
