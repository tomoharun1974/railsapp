# coding: utf-8

class ViewController < ApplicationController
 def index
  render text: 'select'
 end
 def form_for
  @book = Book.new
 end
 def select
  @book = Book.new(publish: '技術評論社')
  @books = Book.select(:id,:publish).distinct
  @review = Review.new
  @authors = Author.all
 end
end
