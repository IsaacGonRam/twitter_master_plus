require 'open-uri'
require 'Nokogiri'

class TwitterScrapper
  def initialize(url)
    @url = Nokogiri::HTML(File.open(url))
  end

  def extract_username
    profile_name = @url.search(".ProfileHeaderCard-name > a")
    puts profile_name.first.inner_text
    puts '-'*75
  end

  def extract_tweets
    tweets = @url.search(".tweet")
    puts "Tweets: "

    tweets.first(5).each do |tweet|
      text_tweet = tweet.css(".js-tweet-text-container").inner_text
      text_tweet = text_tweet.strip
      time = tweet.css("._timestamp").inner_text
      time = time.strip
      retweet = tweet.css(".ProfileTweet-actionCountForPresentation")[1].inner_text
      fav = tweet.css(".ProfileTweet-actionCountForPresentation").last.inner_text
      puts "  #{time}: #{text_tweet}"
      puts "  Retweet: #{retweet}, Favorites: #{fav}"
      puts
    end
   
  end

  def extract_stats
    stats = @url.search(".ProfileNav-value")
    puts "Stats: TWEETS: #{stats[0].inner_text}, SIGUIENDO: #{stats[1].inner_text}, SEGUIDORES: #{stats[2].inner_text}, FAVORITOS: #{stats[3].inner_text}"
    puts "-" * 75
  end

end

# page_web = TwitterScrapper.new
# page_web.extract_username
# page_web.extract_stats
# page_web.extract_tweets

link = ARGV[0]
html_file = open(link)
html_file.read

page_web = TwitterScrapper.new(html_file)
page_web.extract_username
page_web.extract_stats
page_web.extract_tweets



#http://ruby.bastardsbook.com/chapters/html-parsing/