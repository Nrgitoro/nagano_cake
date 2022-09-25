class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  def full_name
    self.name_first + self.name_second
  end
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
