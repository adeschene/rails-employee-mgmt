class Company < ApplicationRecord
  has_many :employees,
    after_add: :inc_count,
    after_remove: :dec_count,
    dependent: :destroy
  has_one :count, dependent: :destroy

  after_save :instantiate_counts

  # When a Company is created, create a Count instance for it
  def instantiate_counts
    self.create_count
  end

  # Increment manager or employee count after creating an Employee
  def inc_count(employee)
    role = employee.role == 'Manager' ? :manager_count : :employee_count
    self.count.update_attribute(role, self.count.read_attribute(role)+1)
  end

  # Decrement manager or employee count after destroying an Employee
  def dec_count(employee)
    role = employee.role == 'Manager' ? :manager_count : :employee_count
    self.count.update_attribute(role, self.count.read_attribute(role)-1)
  end
end
