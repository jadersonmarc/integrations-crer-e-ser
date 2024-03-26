module Wrapper
    class Youtube

        def initialize(videos)
            @videos = videos
        end

        def call
            factore_response_data
        end
        
        private
        attr_reader :videos

        def factore_response_data
            videos.map do |video|
                yt_video = video[:video]
            
                {
                  video_id: yt_video.id.video_id,
                  title: yt_video.snippet.title,
                  description: yt_video.snippet.description,
                  video_url: "https://www.youtube.com/embed/#{yt_video.id.video_id}",
                  thumbnail: yt_video.snippet.thumbnails.default.url,
                }
                
            end
        end
    end
end