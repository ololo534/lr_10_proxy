# frozen_string_literal: true

require 'test_helper'

class NumberControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get index_url
    assert_response :success
  end

end
