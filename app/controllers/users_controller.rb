class UsersController < ApplicationController
  before_action :set_user, only: [:create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.project.build
    #@user.description.build
  end

  def create
    _project = params[:user][:projects].first.last
    _project.each do |project|
      (@user.project << Project.find_by(name: project)) if project.present?
      @user.update_attributes(:project_description => params[:user][:project_description])
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user =  params[:id].present? ?  User.find(params[:id]) : User.find_by(name: user_params[:name])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, projects_attributes: [:id, :name])
  end
end