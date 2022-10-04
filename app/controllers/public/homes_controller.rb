class Public::HomesController < ApplicationController
    
    def top
        @item = Item.all.order(created_at: :desc).page(params[:page]).per(4)
    end
    
end
