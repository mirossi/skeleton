class RegistrationController < Devise::RegistrationsController
  skip_before_filter :require_login
  
  
  def new

    @user= User.new
    @contact = Contact.new
     @person = Person.new
    
  end

  def create
    
    @user = User.new
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation]
    
    @person = Person.new
    @person.lastname = params[:person][:lastname]
    @person.firstname = params[:person][:firstname]

    @contact = Contact.new
    @contact.mobile = params[:contact][:mobile]
    @contact.zip = params[:contact][:zip]
    @contact.street = params[:contact][:street]
    @contact.city = params[:contact][:city]
    @user.valid?
    
    if @user.errors.blank?

      @user.save
      @contact.person = @person
      @contact.save
      @person.contact = @contact
      @person.user = @user
      @contact.save     
      redirect_to home_path
    else
      render :action => "new"
    end
  end

end