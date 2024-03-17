namespace :update do
    desc "Atualiza os vídeos do YouTube"
    task youtube_videos: :environment do
        youtube_client = Clients::Youtube.new
        response = youtube_client.fetch_videos
  
        response.items.each do |item|
            video_id = item.video_id
            title = item.title
            description = item.description
            published_at = item.snippet.published_at
            thumbnail_url = item.thumbnail
            video_url = video_url
  
        video = Video.new(
          video_id: video_id,
          title: title,
          description: description,
          published_at: published_at,
          thumbnail: thumbnail_url,
          video_url: video_url
        )
  
        video.save
      end
  
      puts "Vídeos do YouTube atualizados com sucesso!"
    end
  end