module ApplicationHelper

   def number_of_items_on_cart
    if current_user.cart
      @id = current_user.cart.items.length
      puts "*"*100
      @id
      puts "*"*100
      if @id == 0
        x=0
      else
        x=@id
      end
    end
   end 
end
