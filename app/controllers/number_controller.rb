require 'nokogiri'
require 'open-uri'

# Class for controller
class NumberController < ApplicationController
  def input; end

  def output
      res = Nokogiri::XML(open("#{SERVER_LINK}value=#{params[:value]}"))

      case params[:handling]
      when 'На сервере'
        render :xml => prepare_for_browser(res, XSLT_PATH).to_xml
      when 'В браузере'
        render :inline => xslt_append(res, "#{Rails.root}/public#{XSLT_PATH}").to_html
      when 'Не применять'
        render :xml => res.to_xml
      end
  end

  def xslt_append(xml, xslt_href)
    xslt = Nokogiri::XSLT(File.read(xslt_href))
    xslt.transform(xml)
  end

  def prepare_for_browser(xml, xslt_href)
    ins = Nokogiri::XML::ProcessingInstruction.new(xml, "xml-stylesheet", "type=\"text/xsl\" href=\"#{xslt_href}\"")
    xml.root.add_previous_sibling ins
    xml
  end

  private 

  SERVER_LINK = 'http://localhost:3000/number/output?'
  XSLT_PATH = '/responce_stylesheet.xslt'

end
