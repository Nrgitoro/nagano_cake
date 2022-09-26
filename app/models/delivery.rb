class Delivery < ApplicationRecord
    
    belongs_to :customer
    
    validates :postal_code, presence: true
    validates :address, presence: true
    validates :name, presence: true
    #セレクトボタンの時に使用
    # '〒' + postal_code + ' ' + delivery + ' ' + name
end
