# -*- coding: utf-8 -*-
class Restaurant < ActiveRecord::Base
  attr_accessible :genre, :name, :open_hours, :thumbnail, :url

  validate :url_must_be_tabelog_url
  validate :url_must_be_restaurant_top_page

  def url_must_be_tabelog_url
    errors.add(:base, '食べログのお店を登録してね') unless
      url =~ /^http:\/\/r\.tabelog\.com\//
  end

  def url_must_be_restaurant_top_page
    require 'uri'
    path = URI.parse(url).path
    errors.add(:base, '個別のお店のURLを入力してね') unless
      path.split('/').size == 5
  end

  def collect
    doc = Nokogiri::HTML(open(self.url))
    self.name = doc.css('#rdhead-name span.display-name').text.strip
    self.thumbnail = doc.css('#contents-photo img').first.attribute('src').value

    open_hour_arr = []
    doc.css('#rstdata-wrap table tr').each do |tr|
      self.genre = tr.css('td p').text if tr.css('th').text == 'ジャンル'

      tr.css('td p').each do |p|
        open_hour_arr << p.text
      end if tr.css('th').text == '営業時間'
    end
    self.open_hours = open_hour_arr.join("\n")

    raise StandardError if
      self.name.blank? && self.thumbnail.blank? && self.genre.blank? && self.open_hours.blank?
  end
end
