class QuotesController < ApplicationController
  before_action :authenticate_user
    
  def index
    @quotes = SpiderQuoteService.call(params[:tag])

    if @quotes.empty?
      render json: {"message": :quotes_not_found }, status: :not_found
    else
      @quotes
    end  
  end
end