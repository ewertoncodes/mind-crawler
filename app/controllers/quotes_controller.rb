class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :update, :destroy]
  
  def index
    @quotes = SpiderQuoteService.call(params[:tag])

    if @quotes.empty?
      render json: {"quotes not found": :quotes_not_found }, status: :not_found
    else
      @quotes
    end  
  end
end