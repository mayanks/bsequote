require 'rubygems'
require 'net/http'
require 'json'

module BseQuote
  VERSION = '1.0.0'

  def get_http_data(scrip_code)
    url_string = "http://www.bseindia.com/DotNetStockReachs/DetailedStockReach.aspx?GUID=0b35e756987938&scripcd=#{scrip_code}"
    referer = "http://www.bseindia.com/stockreach/stockreach.htm?scripcd=#{scrip_code}"
    url = URI.parse(url_string)
    http = Net::HTTP.new(url.host,url.port)
    resp = http.get(url.request_uri, { 'Referer' => referer })
    if resp.code == '200'
      return resp.body
    else
      return nil
    end
  end

  def quote(sc_id)
    ret = nil
    names = [ 
      :id, :name, :code, :bid_qty, :bid_rate, # 0 - 4
      :ask_qty, :ask_rate, nil, nil, nil,# 5 - 9 
      nil, nil, :open, :high, :low,# 10 - 14 
      :last_traded_price, nil, nil,:high_52week, :high_52week_date,# 15 - 19 
      :low_52week, :low_52week_date, :prev_close,  nil, nil,# 20 - 24 
      nil, nil, nil, nil, nil,# 25 - 29 
      nil, nil, :group, nil,:sector,# 30 - 34 
      :state, :indexes # 35 - 36 
    ]
    data = get_http_data(sc_id)
    return nil unless data  and data.length > 0
    values = data.split(',')
    ret = {}
    values.each_index do |index|
      ret[names[index]] = values[index] if names[index]
    end
    return ret
  end

end

