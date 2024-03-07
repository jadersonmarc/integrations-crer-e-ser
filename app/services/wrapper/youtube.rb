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
            video_hashes = []
            videos.each do |video|
                yt_video = video[:video]

                video_id = yt_video.id.video_id
                video_title = yt_video.snippet.title
                video_description = yt_video.snippet.description
                video_url = "https://www.youtube.com/watch?v=#{video_id}"
                thumbnail_url = yt_video.snippet.thumbnails.default.url
                published_at = yt_video.snippet.published_at
                # Outras propriedades que você deseja incluir
              
                # Criar o hash do vídeo
                video_hash = {
                  id_video_of_yt: video_id,
                  title: video_title,
                  description: video_description,
                  url_video_yt: video_url,
                  thumbnail: thumbnail_url,
                  published: published_at,
                  # Outras propriedades
                }
              
                # Adicionar o hash à lista
                video_hashes << video_hash
              end
           
              video_hashes
        end
    end
end