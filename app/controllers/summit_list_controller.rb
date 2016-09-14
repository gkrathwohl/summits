class SummitListController < ApplicationController
    
  def index
    @summit_lists = SummitList.all
  end

  def show
    if(params[:id] && SummitList.exists?(params[:id]))
      @summit_list = SummitList.find(params[:id])
    else
      return redirect_to :root
    end

    
  end

  def scrape_peaks
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.peakbagger.com/list.aspx?lid=5167&u=ft&hu=0&pt=avg"))
    rows = doc.css('table.gray tr')

    #create summit_list
    @summit_list = SummitList.create("list_name" => "New Hampshire 4000 Footers")

    rows.each do |row|
      if (row.xpath('td')[1])
        @name = row.xpath('td')[1].text
        @elevation = row.xpath('td')[2].text
        peak_info_doc = Nokogiri::HTML(open("http://www.peakbagger.com/" + row.xpath('td/a/@href')[0].text))
        peak_doc_rows = peak_info_doc.css('table.gray tr')

        peak_doc_rows.each do |peak_row|
          @latlon = peak_row.xpath('td')[0]
          if ( peak_row.xpath('td')[0].text == "Latitude/Longitude (WGS84)")
            @latlon = peak_row.xpath('td')[1].children[2].text[0...-10].split(",")
            @lat = @latlon[0].to_f
            @lon = @latlon[1].to_f
            break
          end
        end

        #create summit
        #create summits_in_list

        puts @name 
        puts @elevation
        puts @lat
        puts @lon

      end
    end
    render text: "complete" 
  end

end





# scratch
# peak_doc = Nokogiri::HTML(open("http://www.peakbagger.com/peak.aspx?pid=6960"))
#rows = peak_doc.css('table.gray tr')