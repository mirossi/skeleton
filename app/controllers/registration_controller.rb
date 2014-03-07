class RegistrationController < Devise::RegistrationsController
  skip_before_filter :require_login
  
  
  def new

    @person= Person.new
    @person.build_user
    @person.build_contact
  end

  def create
    @person= Person.new
    @person.build_user
    @person.build_contact
    
    @user =  @person.user
    @user.username = params[:person][:user_attributes][:username]
    @user.email = params[:person][:user_attributes][:email]
    @user.password = params[:person][:user_attributes][:password]
    @user.password_confirmation =params[:person][:user_attributes][:password_confirmation]
    
 
    @person.lastname = params[:person][:lastname]
    @person.firstname = params[:person][:firstname]

    @contact =  @person.contact
    @contact.mobile = params[:person][:contact_attributes][:mobile]
    @contact.zip = params[:person][:contact_attributes][:zip]
    @contact.street = params[:person][:contact_attributes][:street]
    @contact.city = params[:person][:contact_attributes][:city]

   
    if @person.valid?
      @person.save
      redirect_to "/users/sign_in"
    else
      #flash[:danger] =@person.errors.full_messages.to_sentence 
      render :action => :new
    end
  end
  

end