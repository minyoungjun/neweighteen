class MainController < ApplicationController
  require 'browser'
  require 'yourub'


  before_filter :is_login, :except => ["index", "notice", "login", "password"]

  def fb_load_api


  end

  def index

    if (browser.ie? || browser.ie6?)
      if (request.host.to_s == "18s.sbs.co.kr")
        redirect_to "http://sbs18s.com"
      end
    end

    @youtubes = Array.new

    Tube.where(:hided => false).reverse.each do |tube|
      client = Yourub::Client.new
      youtube = client.get(tube.video_id)
      if youtube != nil
        @youtubes << youtube
      end
    end

    if browser.mobile?
      @facebooks = Fbvideo.where(:hided => false).reverse[0..2]
      @youtubes = @youtubes[0..2]
    else
      @facebooks = Fbvideo.where(:hided => false).reverse
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

      fb.sort_number = fb.id
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
      youtube.sort_number = youtube.id
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

  def password

    if (params[:password].to_s == Admin.last.password)

      session[:admin] = "true"

      redirect_to :action => "admin"

    else

      session[:admin] = "false"

      redirect_to :action => "login"
    end

  end

  def admin
    @youtubes = Tube.order('id' => :desc).page params[:page]

    @facebooks = Fbvideo.order('id' => :desc).page params[:page]

  end

  def delete
    if params[:platform] == "youtube"
      Tube.find(params[:id]).delete
    else
      Fbvideo.find(params[:id]).delete
    end
    redirect_to :action => "admin"
  end

  def toggle

    if params[:platform] == "youtube"
      tube = Tube.find(params[:id])
      if tube.hided
        tube.hided = false
      else
        tube.hided = true
      end
      tube.save
    else
      fb = Fbvideo.find(params[:id])

      if fb.hided
        fb.hided = false
      else
        fb.hided = true
      end
      fb.save
    end
    redirect_to :action => "admin"

  end


end
