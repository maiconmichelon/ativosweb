class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  
  def index
    @groups = Group.all
    respond_to(@groups)
  end

  def show
    respond_to(@group)
  end

  def new
    @group = Group.new
    respond_to(@group)
  end

  def edit
    respond_to(@group)
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @group.update(group_params)
    respond_to(@group, location: @group)
  end

  def destroy
    @group.destroy
    respond_to(nil, location: groups_path)
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
