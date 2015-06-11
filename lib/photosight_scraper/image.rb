class PhotosightScraper::Image
  attr_accessor :id
  def initialize url_or_id
    if url_or_id.class == Fixnum
      @url = "http://www.photosight.ru/photos/#{url_or_id}/"
      @id = url_or_id
    else
      @url = url_or_id
      @id = url_or_id.match(/photos\/(\d+)\/?/)[1].to_i
    end
  end
  def image_url
    page.search('#big_photo').first.attr('href')
  end
  def artistry
    page.search('.photo-vote-block .count')[0].text.to_i
  end
  def originality
    page.search('.photo-vote-block .count')[1].text.to_i
  end
  def technique
    page.search('.photo-vote-block .count')[2].text.to_i
  end
  def like
    page.search('.photo-vote-block .count')[3].text.to_i
  end
  def dislike
    page.search('.photo-vote-block .count')[4].text.to_i
  end
  def title
    page.search('meta[name="og:title"]').first.attr('content')
  end
  def uploaded_at
    text = page.search('.photo-info span').text
    if m = text.match(/(\d{2}\.\d{2}\.\d{4} \d{2}:\d{2})/)
      Time.parse m[1]
    elsif m = text.match(/сегодня (\d{2}):(\d{2})/)
      Time.now.change({hour: m[1], min: m[2]})
    end
  end
  def category
    page.search('.photo > h1 > b > a').first.attr('href').match(/(\d+)/)[1].to_i
  end
  def comments_count
    page.search('.comments > .comment').count
  end
  def author_name
    page.search('.author-name span').text
  end
  def author_id
    page.search('a.author-name').first.attr('href').match(/(\d+)/)[1].to_i
  end
  def views
    page.search('.photo-info .count > b').first.text.to_i
  end

  def page
    @page ||= PhotosightScraper::Client.get @url
  end

  def to_hash
  end

end
