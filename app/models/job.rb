class Job < ApplicationRecord
  belongs_to :user
  has_many :job_applications
  include PgSearch::Model
  pg_search_scope :search_by_title_and_location,
  against: [:title, :location],
   using: {
     tsearch: { prefix: true }
              }
end
