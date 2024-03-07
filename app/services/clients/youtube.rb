require 'httparty'
require 'google/apis/youtube_v3'

module Clients
    class Youtube
        include HTTParty
        API_KEY = Rails.application.config.api_key
        CHANNEL_ID = Rails.application.config.channel_id
        RESULTS_PER_PAGE = 15
       
        
        def get_videos_by_channel_id
            youtube = Google::Apis::YoutubeV3::YouTubeService.new
            youtube.key = API_KEY
            results_per_page = 20

            begin
              response = youtube.list_searches('snippet', type: 'video', channel_id: CHANNEL_ID, max_results: results_per_page)
              Wrapper::Youtube.new(response.items.map { |item| {title: item.snippet.title , video: item }  }).call
          
            rescue Google::Apis::Error => e
              puts "Erro na requisição: #{e.message}"
              return []
            end
        end

        def fetch_videos(page_token = nil)
            youtube = Google::Apis::YoutubeV3::YouTubeService.new
            youtube.key = API_KEY

            options[:page_token] = page_token if page_token
        
            response = youtube.list_searches('snippet', channel_id: CHANNEL_ID, type: 'video', max_results: RESULTS_PER_PAGE, order: 'date')
        
            Wrapper::Youtube.new(response.items.map { |item| {title: item.snippet.title , video: item }  }).call
          end
        
          def fetch_top_videos( page_token = nil)
            youtube = Google::Apis::YoutubeV3::YouTubeService.new
            youtube.key = API_KEY
        
            response = youtube.list_searches('snippet', channel_id: CHANNEL_ID, type: 'video', max_results: RESULTS_PER_PAGE, order: 'rating')
          end

    end
end

