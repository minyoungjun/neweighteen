class MainController < ApplicationController
require 'browser'
  def index

    if (browser.ie? || browser.ie6?)
  
      redirect_to "http://sbs18s.com"

    end

  end

  def notice

    if (browser.ie? || browser.ie6?)
  
      redirect_to "http://sbs18s.com"

    end

    @notice = true

  end
end
