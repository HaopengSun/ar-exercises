class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {greater_than: 0, only_integer: true}
  validate :must_carry_mens_or_womens_clothes

  def must_carry_mens_or_womens_clothes
    if mens_apparel == false and womens_apparel == false
      errors.add(:mens_apparel, "You cannot make create a store that also does not carry either men's or women's apparel.")
    end
  end

end
