require 'spec_helper'

describe PhotosightScraper::Image do
  let(:image_url){'http://www.photosight.ru/photos/5950452/'}
  subject{ PhotosightScraper::Image.new(image_url) }
  before(:each){ allow(PhotosightScraper::Client).to receive(:get) { Nokogiri::HTML(File.read('./spec/fixtures/image_5950452.html')) } }
  it('.id')             {subject.id.should == 5950452}
  it('.image_url')      {subject.image_url.should == 'http://img-4.photosight.ru/28a/5950452_xlarge.jpg'}
  it('.artistry')       {subject.artistry.should == 113}
  it('.originality')    {subject.originality.should == 0}
  it('.technique')      {subject.technique.should == 3}
  it('.like')           {subject.like.should == 13}
  it('.dislike')        {subject.dislike.should == 1}
  it('.title')          {subject.title.should == 'Май'}
  it('.views')          {subject.views.should > 400}
  it('.author_name')    {subject.author_name.should == 'Анна Власенко'}
  it('.author_id')      {subject.author_id.should == 173829}
  it('.uploaded_at')    {subject.uploaded_at.should == Time.parse('03.06.2015 07:25')}
  it('.category')       {subject.category.should == 36}
  it('.comments_count') {subject.comments_count.should == 107}
end
