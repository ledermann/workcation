class PropertiesController < ApplicationController
  def index
    render inertia: 'PropertyList', props: {
      properties: properties.as_json(
        only: [
          :id,
          :title,
          :beds,
          :baths,
          :rating,
          :review_count,
          :price,
          :image_url
        ],
        include: {
          location: {
            only: [
              :id,
              :title,
              :description
            ]
          }
        }
      ),
      accountLinks: helpers.account_links,
      primaryLinks: helpers.primary_links
    }
  end

  private

  def properties
    Property.
      search_for_keywords(params[:keywords]).
      search_for_beds(params[:beds]).
      search_for_baths(params[:baths]).
      search_for_price(params[:price]).
      includes(:location)
  end
end
