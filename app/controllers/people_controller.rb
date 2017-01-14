class PeopleController < ApplicationController
  expose :people, -> { Kaminari.paginate_array(Person.all.map{ |person| PersonDecorator.new(person) }).page(params[:page] || 1).per(10) }
  expose :person, decorate: ->(person){ PersonDecorator.new(person) }

  def create
    if person.save
      flash[:success] = 'The person was saved!'
      redirect_to people_path
    else
      could_not_be_saved(:new)
    end
  end

  def update
    if person.update_attributes(person_params)
      flash[:success] = 'The person was saved!'
      redirect_to person_path(person)
    else
      could_not_be_saved(:edit)
    end
  end

  def destroy
    person.destroy
    flash[:success] = 'The person was deleted!'
    redirect_to people_path
  end

  private

  def could_not_be_saved(view_to_render)
    flash[:warning] = 'The person couldn\'t be saved'
    render view_to_render
  end

  def person_params
    params.require(:person).permit(:email, :first_name, :last_name, :picture, :birthdate, :gender, :bio)
  end
end
