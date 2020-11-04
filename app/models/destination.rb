class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_5_posts
        self.posts.reverse.slice(0,4)
    end

    def post_with_most_likes
        self.posts.max_by { |post| post.likes}
    end

    def avg_age
        self.bloggers.map {|blogger| blogger.age}.sum / self.bloggers.count.to_f
    end
    
end