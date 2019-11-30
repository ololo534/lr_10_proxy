# frozen_string_literal: true

require 'test_helper'

class NumberControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get number_input_url
    assert_response :success
  end

  test 'should get output' do
    get number_output_url
    assert_response :success
  end

  test '0 for negative' do
    get number_output_url, params: { value: -1}
    assert_equal assigns[:result].length, 1
  end

  test '0 for string' do
    get number_output_url, params: {value: 'Hello, World!'}
    assert_equal assigns[:result].length, 1
  end

  test 'normal data' do
    get number_output_url, params: {value: 5}
    assert_equal assigns[:result].length, 3
  end
end
