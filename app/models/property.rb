class Property < ApplicationRecord
  belongs_to :location

  scope :search_for, ->(string) do
    string.split(' ').reduce(self) do |result, word|
      result.where('title ILIKE ?', "%#{sanitize_sql_like word.strip}%")
    end
  end
end
