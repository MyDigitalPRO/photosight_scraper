class PhotosightScraper::Client
    UA = 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0'
    def self.get url
      Nokogiri::HTML RestClient.get(url, user_agent: UA)
    end
end
