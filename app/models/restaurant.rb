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
end
