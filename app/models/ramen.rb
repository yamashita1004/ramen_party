class Ramen < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  validates :genre, presence: true
  validates :name, presence: true,length:{ minimum: 1, maximum: 20 }
  validates :address, presence: true,length:{ minimum: 1, maximum: 100 }
  validates :introduction, presence: true,length:{ minimum: 1, maximum: 200 }
  validates :image, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
