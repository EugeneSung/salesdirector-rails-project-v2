class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :logged_in?, :current_employee, :current_user_type, :item_checker, :after_shipped

  # def cart
  #   session[:cart] ||= []
  # end



  private
  def after_shipped(invoice)
    invoice.invoice_items.each do |invoice_item|

      invoice_item.item.inventory = invoice_item.item.inventory - invoice_item.shipped
      invoice_item.item.update_attribute(:inventory, invoice_item.item.inventory)
    
    end
  end

  def item_checker(invoice_item, item)

    if invoice_item.object.item_id == item.id

          true
    else

          false
    end




  end

   def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end


  def current_user_type

    if current_user.admin
      @user_type = Employee.find_by(user_id: current_user.id)
    else
      @user_type = Customer.find_by(user_id: current_user.id)
    end

  end

  def logged_in?
   !!current_user
  end
  def require_login
    redirect_to root_url  unless current_user
  end
  def require_admin
    redirect_to user_path(current_user)  unless current_user.admin
  end

end
