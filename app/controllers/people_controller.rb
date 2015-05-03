class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = @company.people
    respond_with(@people)
  end

  def show
    respond_with(@person)
  end

  def new
    @person = @company.people.new
    respond_with(@person)
  end

  def edit
    respond_with(@person)
  end

  def create
    @person = Person.create(person_params)
    respond_with(@company, @person)
  end

  def update
    @person.update(person_params)
    respond_with(@company, @person)
  end

  def destroy
    @person.destroy
    respond_with(nil, people_path)
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :group_id)
    end
end
