class Cat < ApplicationRecord
	belongs_to :user
	belongs_to :cat_egory
	has_many :reviews

  has_attached_file :cat_image, :styles => { :cat_index => "250x350>", :cat_show  => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cat_image, :content_type => /\Aimage\/.*\z/
end
