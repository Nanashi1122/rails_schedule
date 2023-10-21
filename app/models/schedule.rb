class Schedule < ApplicationRecord
    validates :title, presence: true, length: {maximum: 500}
    validates :start_day, presence: true
    validates :end_day, presence: true
    validate :start_end_date

    def start_end_date
        return if start_day.blank? || start_day.blank?
        errors.add(:end_day, "が開始日より前になっています") if end_day < start_day
    end
end