class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :set_user_for_permission, only: [:define_permission, :define_admin_permission, :remove_permission]

  def index
    if (current_user)
      @companies = current_user.decorate.companies
      respond_with(@companies)
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.owner = current_user
    if @company.save
      redirect_to action: :index
    else
      respond_with(@company)
    end
  end

  def update
    @company.update(company_params)
    redirect_to action: :index
  end

  def permissions
  end

  def define_permission
    if current_company.admin? current_user
      company_user = current_company.company_user_by_user(@user_form_permission)
      company_user ||= current_company.company_users.build(user: @user_form_permission)

      company_user.admin = false
      company_user.save
    end

    redirect_to action: 'permissions'
  end

  def remove_permission
    if current_company.admin? current_user
      company_user = current_company.company_user_by_user(@user_form_permission)
      company_user.destroy if company_user
    end

    redirect_to action: 'permissions'
  end

  def define_admin_permission
    if current_company.owner?(current_user)
      company_user = current_company.company_user_by_user(@user_form_permission)
      company_user ||= current_company.company_users.build(admin: true, user: @user_form_permission)
      company_user.admin = true
      company_user.save
    end

    redirect_to action: 'permissions'
  end

private
  def set_company
    @company = current_user.companies.find(params[:id])
  end

  def set_user_for_permission
    @user_form_permission = User.find(params[:user_id])
  end

  def company_params
    params.require(:company).permit(:name, :owner_id)
  end

end
