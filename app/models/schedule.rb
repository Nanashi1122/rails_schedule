class Schedule < ApplicationRecord
    validates :title, presence: true, length: {maximum: 500}
    validates :start_day, presence: true
    validates :end_day, presence: true
end
