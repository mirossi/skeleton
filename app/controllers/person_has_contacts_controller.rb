class PersonHasContactsController < ApplicationController
  before_action :set_person_has_contact, only: [:show, :edit, :update, :destroy]

  # GET /person_has_contacts
  # GET /person_has_contacts.json
  def index
    @person_has_contacts = PersonHasContact.all
  end

  # GET /person_has_contacts/1
  # GET /person_has_contacts/1.json
  def show
  end

  # GET /person_has_contacts/new
  def new
    @person_has_contact = PersonHasContact.new
  end

  # GET /person_has_contacts/1/edit
  def edit
  end

  # POST /person_has_contacts
  # POST /person_has_contacts.json
  def create
    @person_has_contact = PersonHasContact.new(person_has_contact_params)

    respond_to do |format|
      if @person_has_contact.save
        format.html { redirect_to @person_has_contact, notice: 'Person has contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @person_has_contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @person_has_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_has_contacts/1
  # PATCH/PUT /person_has_contacts/1.json
  def update
    respond_to do |format|
      if @person_has_contact.update(person_has_contact_params)
        format.html { redirect_to @person_has_contact, notice: 'Person has contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person_has_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_has_contacts/1
  # DELETE /person_has_contacts/1.json
  def destroy
    @person_has_contact.destroy
    respond_to do |format|
      format.html { redirect_to person_has_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_has_contact
      @person_has_contact = PersonHasContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_has_contact_params
      params.require(:person_has_contact).permit(:person, :contact)
    end
end
