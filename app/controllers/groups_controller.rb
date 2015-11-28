class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = @company.groups.page(params[:page])
    respond_with(@groups)
  end

  def show
    respond_with(@group)
  end

  def new
    @group = @company.groups.new
    respond_with(@group)
  end

  def edit
    respond_with(@group)
  end

  def create
    @group = @company.groups.create(group_params)
    respond_with(@company, @group)
  end

  def update
    @group.update(group_params)
    respond_with(@company, @group)
  end

  def destroy
    @group.destroy
    redirect_to action: :index
  end

  private
    def set_group
      @group = @company.groups.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :company_id)
    end
end
