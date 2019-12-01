require 'test_helper'
require 'selenium-webdriver'

class MainControllerTest < ActionDispatch::IntegrationTest
  test 'go to the main page' do
    get index_url
    assert_response :success
  end

  test 'check result page' do
    get result_url, params: { value: 33, handling: 'На сервере'}
    assert_response :success
  end
end
