require 'test_helper'

class CheckFormatTest < ActionDispatch::IntegrationTest
  def setup; end

  def teardown; end

  test 'check response with server processing' do
    get result_path, :params => {:value => 33, :handling => 'На сервере'}
    content = '<?xml-stylesheet type="text/xsl" href="/responce_stylesheet.xslt"?>'
    assert response.body.include?(content)
  end

  test 'check response with browser processing' do
    get result_path, :params => {:value => 33, :handling => 'В браузере'}
    content = %w(<html> <head> <body> <td>33</td>)
    res = response.body
    assert content.all? { |str| res.include?(str) }
  end

  test 'check response without any' do
    get result_path, :params => {:value => 33, :handling => 'Не применять'}
    content = %w(<?xml version="1.0" encoding="UTF-8"?> <arrays type="array"> <array>33</array>)
    not_inc = '<?xml-stylesheet type="text/xsl" href="/responce_stylesheet.xslt"?>'
    res = response.body
    assert content.all? { |str| response.body.include?(str) && res.exclude?(not_inc)}
  end
end
