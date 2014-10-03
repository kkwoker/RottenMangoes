class Movie < ActiveRecord::Base


  mount_uploader :image, PosterUploader


	has_many :reviews
  belongs_to :user
  LESS_THAN_90 = "1"
  BETWEEN_90_120 = "2"
  GREATER_THAN_120 = "3"

  scope :search, -> (query){  where("title like ? or director like ?", "%#{query}%", "%#{query}%")}
  scope :runtime, -> (runtime_query) { 
    case runtime_query
    when LESS_THAN_90
      where("runtime_in_minutes < 90")
    when BETWEEN_90_120
      where("runtime_in_minutes BETWEEN 90 and 120")
    when GREATER_THAN_120
      where("runtime_in_minutes > 120")
    end


    }


	# validates :title,
    # presence: true

  # validates :director,
    # presence: true

  # validates :runtime_in_minutes,
    # numericality: { only_integer: true }

  # validates :description,
    # presence: true


  # validates :release_date,
    # presence: true

  # validate :release_date_is_in_the_future

  def review_average
  	reviews.sum(:rating_out_of_ten) / reviews.size if reviews.size > 0
  end

  # def self.search(title_query, director_query, runtime_query)
  #   case runtime_query
  #   when ""
  #     where("title like ? and director like ?", "%#{title_query}%", "%#{director_query}%")
  #   when "1" 
  #     where("title like ? and director like ? and runtime_in_minutes < 90", "%#{title_query}%", "%#{director_query}%")
  #   when "2"
  #     where("title like ? and director like ? and runtime_in_minutes BETWEEN 90 and 120", "%#{title_query}%", "%#{director_query}%")
  #   when "3"
  #     where("title like ? and director like ? and runtime_in_minutes > 120", "%#{title_query}%", "%#{director_query}%")
  #   end
  # end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end


end
