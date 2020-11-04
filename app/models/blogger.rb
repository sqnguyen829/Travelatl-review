class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: {case_sensitive: false}
    validates :age, numericality: {greater_than_or_equal_to: 0}
    validates :bio, length: {minimum: 30}

    def total_likes
        total= 0
        self.posts.each do |post|
            total += post.likes
        end
        total
    end

    def feature_post
        self.posts.max_by {|post| post.likes}
    end

    def top_5
        sorted_destinations =self.destinations.sort {|d1, d2| d2.posts.count <=> d1.posts.count}
        sorted_destinations.slice(0,4)
    end

    # def self.avg
    #     self.map {|blogger| blogger.age}.sum / self.count.to_f
    # end

end
