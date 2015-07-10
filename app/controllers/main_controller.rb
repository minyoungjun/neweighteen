class MainController < ApplicationController
require 'browser'
  def index

    if (browser.ie? || browser.ie6?)
      if (request.host.to_s == "18s.sbs.co.kr")
        redirect_to "http://sbs18s.com"
      end
    end

  end

  def notice

    if (browser.ie? || browser.ie6?)

      if (request.host.to_s == "18s.sbs.co.kr")
        redirect_to "http://sbs18s.com/notice"
      end
  
    end

    @notice = true

  end
end
