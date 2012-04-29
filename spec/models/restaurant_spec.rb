# -*- coding: utf-8 -*-
require 'spec_helper'

describe Restaurant do
  describe '#url' do
    it 'returns true given a tabelog url' do
      url = 'http://r.tabelog.com/osaka/A2701/A270103/27044987/'
      rst = Restaurant.new(url: url)
      rst.should be_valid
    end
    it 'returns false given a non tabelog url' do
      url = 'http://r.gnavi.co.jp/g286902/'
      rst = Restaurant.new(url: url)
      rst.should_not be_valid
    end
    it 'returns false given a non restaurant top url' do
      url = 'http://r.tabelog.com/osaka/A2701/A270103/'
      rst = Restaurant.new(url: url)
      rst.should_not be_valid
    end
    it 'returns false given a non restaurant top url' do
      url = 'http://r.tabelog.com/osaka/A2701/A270103/27012869/dtlphotolst'
      rst = Restaurant.new(url: url)
      rst.should_not be_valid
    end
    it 'returns false given a non restaurant top url' do
      url = 'http://r.tabelog.com/osaka/A2701/A270103/27012869/dtlphotolst/'
      rst = Restaurant.new(url: url)
      rst.should_not be_valid
    end
  end

  describe '#collect' do
    it 'collects data from url' do
      url = 'http://r.tabelog.com/osaka/A2701/A270103/27044987/'
      rst = Restaurant.new(url: url)
      rst.collect

      rst.name.should_not be_blank
      rst.thumbnail.should_not be_blank
      rst.genre.should_not be_blank
      rst.open_hours.should_not be_blank
    end

    it 'raises the error given a malformed url' do
      url = 'http://r.tabelog.com/osaka/A2701/A270103/hoge/'
      rst = Restaurant.new(url: url)
      Proc.new{ rst.collect }.should raise_error(OpenURI::HTTPError)
    end

    it 'redirects to 500 on failure' do
      pending 'use stub'
    end
  end
end
