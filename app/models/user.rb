class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  accepts_nested_attributes_for :books

  attachment :profile_image
    validates :name, uniqueness: { case_sensitive: :true }, length: { in: 2..20 }
    validates :introduction, length: { maximum: 50 }
end
