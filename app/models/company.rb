class Company < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_one :count, dependent: :destroy
end
