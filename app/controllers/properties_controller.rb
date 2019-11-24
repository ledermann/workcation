class PropertiesController < ApplicationController
  def index
    render inertia: 'Properties/Index', props: {
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

  def new
    render inertia: 'Properties/New', props: {
      accountLinks: helpers.account_links,
      primaryLinks: helpers.primary_links,
      locations: Location.all.as_json(only: [:id, :title])
    }
  end

  def create
    @property ||= Property.new(
      property_params.merge(
        review_count: 0,
        rating: 0,
        image_url: example_images.sample
      )
    )

    if @property.save
      redirect_to properties_path, notice: 'Property was successfully created.'
    else
      session[:errors] = @property.errors
      redirect_to new_property_path, alert: 'Property cannot be saved!'
    end
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

  def property_params
    params.require(:property).permit(:title, :beds, :baths, :price, :location_id)
  end

  def example_images
    [
      'https://images.unsplash.com/photo-1449844908441-8829872d2607?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1510627489930-0c1b0bfb6785?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1527030280862-64139fba04ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80'
    ]
  end
end
