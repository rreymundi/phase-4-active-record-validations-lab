class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :clickbait

    def clickbait
        self.title == "True Facts" ? errors.add(:title, "We don't like clickbait!") : self.title
    end
end
