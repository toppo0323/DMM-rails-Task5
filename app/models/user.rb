class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorite_by?(book_id)
   favorites.where(book_id: book_id).exists?
  end
 
  attachment :profile_image
 
 
 validates :name, uniqueness: true,presence: true,length: { minimum: 2, maximum: 20}
 validates :introduction,length: { maximum: 50}

end