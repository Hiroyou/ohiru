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
end
