class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

  def new
  	@contacts = Contact.new
  end

  def create
  	@contacts = Contact.new(params_contact)
  	if @contacts.save
  		flash[:notice] = "Success, udah gw kirim ke admin"
  		redirect_to action: 'index'
  	else
  		flash[:error] = "data kurang valid bos"
  		render 'new'
  	end
  end

  private
  def params_contact
  	params.require(:contact).permit(:name,:email,:pesan)
  end

end
