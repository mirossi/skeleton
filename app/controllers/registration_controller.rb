class RegistrationController < Devise::RegistrationsController
  skip_before_filter :require_login
  
  
  def new

    @user= User.new
    @contact = Contact.new
  end

  def create

    @user = User.new
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation]

    @contact = Contact.new
    @contact.mobile = params[:contact][:mobile]
    @contact.address = params[:contact][:address]
    @user.valid?
    if @user.errors.blank?

      @user.save
      @contact.user = @user
      @contact.save
      redirect_to home_path
    else
      render :action => "new"
    end
  end

end