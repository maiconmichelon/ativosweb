class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
    respond_with(@groups)
  end

  def show
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
    respond_with(@group)
  end

  def create
    @group = Group.create(group_params)
    respond_with(@group, location: @group)
  end

  def update
    @group.update(group_params)
    respond_with(@group, location: @group)
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
      params.require(:group).permit(:name)
    end
end
