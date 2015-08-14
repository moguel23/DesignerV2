class Site < ActiveRecord::Base
  #ASSOCIATIONS
  belongs_to :customer

  #VALIDATION
  validates :name, presence: true
  validates :code, presence: true
  validates :customer_id, presence: true
end
