module ApplicationHelper
  def primary_links
    [
      {
        name: 'List your property',
        url: '#'
      },
      {
        name: 'Trips',
        url: '#'
      },
      {
        name: 'Messages',
        url: '#'
      }
    ].freeze
  end

  def account_links
    [
      {
        name: 'Account settings',
        url: '#account'
      },
      {
        name: 'Support',
        url: '#support'
      },
      {
        name: 'Sign out',
        url: '#sign-out'
      }
    ].freeze
  end
end
