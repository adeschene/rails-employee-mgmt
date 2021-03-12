require 'rails_helper'

RSpec.describe Employee, :type => :model do
  it 'increases employee count when saving employees' do
    # Create a company instance
    company  = Company.create(name: "Best Buy")
    # Create employee and manager instances
    employee = company.employees.create({email: "emp1@bestbuy.com", role: "Employee"})
    manager  = company.employees.create({email: "man1@bestbuy.com", role: "Manager"})
    # Get companys count instance
    best_buy_counts = company.count
    # Verify that each count has been incremented by 1 (==1)
    expect(best_buy_counts.employee_count).to eq(1)
    expect(best_buy_counts.manager_count).to eq(1)
  end

  it 'decreases employee count when destroying employees' do
    # Create a company instance
    company  = Company.create(name: "Best Buy")
    # Create employee and manager instances
    employee = company.employees.create({email: "emp1@bestbuy.com", role: "Employee"})
    manager  = company.employees.create({email: "man1@bestbuy.com", role: "Manager"})
    # Destroy employee and manager instances
    company.employees.destroy(employee.id)
    company.employees.destroy(manager.id)
    # Get companys count instance
    best_buy_counts = company.count
    # Verify that each count has been decremented by 1 (==0)
    expect(best_buy_counts.employee_count).to eq(0)
    expect(best_buy_counts.manager_count).to eq(0)
  end
end
