class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates :description,:image_url,:title, presence: true

  validates :image_url, format: { with: %r{\.(gif|jpg|jpeg|png)$}i,
									message: "Please upload valid image files"}

  validates :price,numericality: {greater_than_or_equal_to: 0.01}

  validates :title ,uniqueness: true

  default_scope order: 'title'

  has_many :line_items

  has_many :orders ,through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item





  def ensure_not_referenced_by_any_line_item

  	if line_items.count.zero?
  		return true
  	else
  		errors.add(:base,"line item present")
  		return false
  	end

  end
end
