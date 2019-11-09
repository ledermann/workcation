class Location < ApplicationRecord
  has_many :properties, dependent: :destroy

  accepts_nested_attributes_for :properties, reject_if: proc { |attributes| attributes['title'].blank? }
end
