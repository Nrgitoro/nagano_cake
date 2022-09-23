class Public::HomesController < ApplicationController
    
    def top
        @item = Item.order( 'id DESC' ).limit(4)
    end
    
    # def index
    #     @items = items.all.order(created_at: :desc)
    # end

end
