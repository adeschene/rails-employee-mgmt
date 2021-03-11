class Employee < ApplicationRecord
  belongs_to :company

  after_save :inc_count
  before_destroy :dec_count

  # Increment manager or employee count after creating an Employee
  def inc_count
    role = self.role == 'Manager' ? :manager_count : :employee_count
    self.company.count.update_attribute(role, self.company.count.read_attribute(role)+1)
  end

  # Decrement manager or employee count before destroying an Employee
  def dec_count
    role = self.role == 'Manager' ? :manager_count : :employee_count
    self.company.count.update_attribute(role, self.company.count.read_attribute(role)-1)
  end
end
