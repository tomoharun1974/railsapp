# coding: utf-8

class ViewController < ApplicationController
 def index
  render text: 'select'
 end

 def select
  @book = Book.new(publish: '技術評論社')
  @books = Book.select(:id,:publish).distinct
 end
end
