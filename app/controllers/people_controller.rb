class PeopleController < ApplicationController
  expose :people, -> { Person.page(params[:page] || 1).per(10) }
  expose :person

  def create
    if person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def update
    if person.update_attributes(person_params)
      redirect_to people_path
    else
      render :edit
    end
  end

  def destroy
    person.destroy
    redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:email, :first_name, :last_name, :picture, :birthdate)
  end
end
