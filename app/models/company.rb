class Company < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_one :count, dependent: :destroy

  after_create :instantiate_counts

  # When a Company is created, create a Count instance for it
  def instantiate_counts
    self.create_count
  end
end
