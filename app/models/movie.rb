class Movie < ActiveRecord::Base

  has_one :vote

  accepts_nested_attributes_for :vote

  has_attached_file :thumbnail, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
