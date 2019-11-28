require 'application_system_test_case'

class BasicTest < ApplicationSystemTestCase
  setup do
    Location.create!(
      title: 'Testcity',
      description: "Just an example"
    )
  end

  test 'click around' do
    visit root_url
    assert_home

    click_on 'Book your escape'
    assert_property_index

    click_on 'List your property'
    assert_property_new

    page.driver.go_back
    assert_property_index

    page.driver.go_back
    assert_home
  end

  test 'create new property' do
    visit new_property_url
    assert_property_new

    fill_in 'Title', with: 'Test house'
    fill_in 'Beds', with: '3'
    fill_in 'Baths', with: '2'
    select 'Testcity', from: 'Location'
    click_on 'Create Property'
    assert_selector 'div', text: 'There is one form error.'
    assert_selector 'div', class: 'form-error', text: "can't be blank"

    fill_in 'Price /wk', with: '20000'
    click_on 'Create Property'

    assert_property_index
    assert_selector 'div', text: 'Property was successfully created.'
    assert_selector 'h4', text: 'Test house'
  end

  def assert_home
    assert_selector 'h1', text: 'You can work from anywhere'
  end

  def assert_property_index
    assert_title 'Properties | Workcation'
  end

  def assert_property_new
    assert_title 'New property | Workcation'
  end
end
