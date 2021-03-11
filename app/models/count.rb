class Count < ApplicationRecord
  belongs_to :company

  # Sets default counts to 0
  attribute :employee_count, :integer, default: 0
  attribute :manager_count, :integer, default: 0
end
