class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         validates :name_first, presence: true
         validates :name_second, presence: true
         validates :tel, presence: true
         validates :post_code, presence: true
         validates :address, presence: true
         validates :name_second_rubi, presence: true
         validates :name_firdt_rubi, presence: true

  has_many :cart_items
  has_many :deliveries
  def full_name
    self.name_first + self.name_second
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
