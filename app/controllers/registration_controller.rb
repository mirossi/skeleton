class RegistrationController < Devise::RegistrationsController
  skip_before_filter :require_login
  
  
  def new

    @person= Person.new
    @person.build_user
    @person.contacts.build
  end

  def create
    @person= Person.create(person_params)
    if @person.valid?
      @person.save
      flash[:info] ="Neuer account erstellt"
      redirect_to "/users/sign_in"
    else
      #flash[:danger] =@person.errors.full_messages.to_sentence 
      render :action => :new
    end

    #@person= Person.new
    #@person.build_user
    #@person.contacts.build
    #
    #@user =  @person.user
    #@user.username = params[:person][:user_attributes][:username]
    #@user.email = params[:person][:user_attributes][:email]
    #@user.password = params[:person][:user_attributes][:password]
    #@user.password_confirmation =params[:person][:user_attributes][:password_confirmation]
    #
    #
    #@person.lastname = params[:person][:lastname]
    #@person.firstname = params[:person][:firstname]
    #
    #
    #@person.contacts[0].mobile = params[:person][:contacts_attributes]['0'][:mobile]
    #@person.contacts[0].zip = params[:person][:contacts_attributes]['0'][:zip]
    #@person.contacts[0].street = params[:person][:contacts_attributes]['0'][:street]
    #@person.contacts[0].city= params[:person][:contacts_attributes]['0'][:city]
  end


  def person_params
    # It's mandatory to specify the nested attributes that should be whitelisted.
    # If you use `permit` with just the key that points to the nested attributes hash,
    # it will return an empty hash.
    params.require(:person).permit(:lastname, :firstname, contacts_attributes:[:mobile,:zip, :street, :city],user_attributes: [ :username, :email,:password , :password_confirmation])
  end
  

end