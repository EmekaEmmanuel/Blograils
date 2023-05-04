class User < ApplicationRecord
    has_many :posts, foreign_key: :author_id, dependent: :delete_all
    has_many :comments, foreign_key: :author_id, dependent: :delete_all
    has_many :likes, foreign_key: :author_id, dependent: :delete_all

    def latest_three_posts
        posts.order(created_at: :desc).limit(3)
    end

end
