FactoryBot.define do
  factory :video do
    id_video_of_yt { "MyString" }
    title { "MyString" }
    description { "MyText" }
    url_video_yt { "MyString" }
    thumbnail { "MyString" }
    published { "2024-01-06 17:27:58" }
    duration { 1 }
    view { 1 }
    channel_video_id { "MyString" }
    category { "MyString" }
    incorporated_url { "MyString" }
    likes { 1 }
    dislikes { 1 }
  end
end
