class Property < ApplicationRecord
  belongs_to :location, inverse_of: :properties

  validates :title, presence: true
  validates :beds, :baths, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, :baths, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :rating, presence: true
  validates :review_count, presence: true
  validates :image_url, presence: true

  scope :search_for_keywords, lambda { |keywords|
    if keywords.present?
      keywords.split(' ').reduce(self) do |result, word|
        result.where('title ILIKE ?', "%#{sanitize_sql_like word.strip}%")
      end
    else
      all
    end
  }

  scope :search_for_beds, lambda { |min|
    min ? where("beds >= ?", min.to_i) : all
  }

  scope :search_for_baths, lambda { |min|
    min ? where("baths >= ?", min.to_i) : all
  }

  scope :search_for_price, lambda { |max|
    max ? where("price <= ?", max.to_i) : all
  }
end
