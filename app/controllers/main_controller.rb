class MainController < ApplicationController
require 'browser'
require 'yourub'
  def index

    if (browser.ie? || browser.ie6?)
      if (request.host.to_s == "18s.sbs.co.kr")
        redirect_to "http://sbs18s.com"
      end
    end

    @youtubes = Array.new

    Tube.all.reverse.each do |tube|
      client = Yourub::Client.new
      @youtubes << client.get(tube.video_id)
    end

    @facebooks = Fbvideo.all.reverse

  end

  def notice

    if (browser.ie? || browser.ie6?)

      if (request.host.to_s == "18s.sbs.co.kr")
        redirect_to "http://sbs18s.com/notice"
      end
  
    end

    @notice = true

  end
  def test

    client = Yourub::Client.new
    client.search(query: "18초", order: 'date') do |v|
        puts v
    end
    render :text => "wow"
  end

  def facebook

  end

  def youtube

  end

  def upload_facebook

    uurl = ""

    params[:code].split(/"/).each do |code|

      if code[0..2] == "htt"
        uurl = code 
        puts uurl
      end

      end
    
    fbs = Fbvideo.where(:url => uurl)

    if fbs.count  == 0

      fb = Fbvideo.new
      fb.url = uurl
      fb.video_id = uurl.split("/").last
      fb.save

    else

      fb = fbs.first
    end

    redirect_to :action => "facebook_uploaded", :id => fb.id
    
  end

  def upload_youtube

    q = Rack::Utils.parse_query URI(params[:url].to_s).query

    if q.count == 0
      youtube_id = params[:url].split("/")[3]
    else
      youtube_id = q["v"]
    end
  
    tube_array = Tube.where(:video_id => youtube_id)
    if tube_array.count == 0
      youtube = Tube.new
      youtube.video_id = youtube_id
      youtube.save
    else
      youtube = tube_array.first
    end

    redirect_to :action => "youtube_uploaded", :id => youtube.id

  end

  def youtube_uploaded

    @youtube = Tube.find(params[:id])
    #client = Yourub::Client.new
    #render :text => client.get(Tube.find(params[:id]).video_id).inspect

  end

  def facebook_uploaded

    @facebook = Fbvideo.find(params[:id])

  end



end
