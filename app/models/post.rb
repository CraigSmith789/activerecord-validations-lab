class Post < ActiveRecord::Base
  
  validates :title, presence: true
  validates :content, length: { minimum:250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  private
  
  def title_rules_adhered?
    if title != nil
    title.include?("Won't Believe" || "Secret Top [number]" || "Guess")
    end
  end
  def clickbait?
    unless title_rules_adhered?
      errors.add(:title, "must contain 'clickbait'")
    end  
  end

end
