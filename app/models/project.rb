class Project < ApplicationRecord
  has_one :alpha_framework

  has_many :sprints

  has_many :scrum_members
  accepts_nested_attributes_for :scrum_members, allow_destroy: true

  has_many :backlog_items

  validates :name,  presence: true, length: { maximum: 50 }

  validates :length,  presence: true, numericality: {greater_than_or_equal_to: 1}

  validates :start, presence: true
  validates :end, presence: true
  validate :date_check


def date_check
	if self.start.nil? == false && self.end.nil? == false && self.start >= self.end
		errors.add(:start, "開始日を正しく記入して下さい。")
		errors.add(:end, "終了日を正しく記入して下さい。")
	end
end
end