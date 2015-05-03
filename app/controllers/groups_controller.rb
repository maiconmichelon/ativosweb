class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = @company.groups
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
    respond_with(nil, location: groups_path)
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :company_id)
    end
end
