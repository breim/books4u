class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :check_user_professor, only: [:new, :create]
  before_action :authenticate_user!

  respond_to :html

  def index
    @professors = Professor.all
    respond_with(@professors)
  end

  def show
    respond_with(@professor)
  end

  def new
    @professor = Professor.new
    respond_with(@professor)
  end

  def edit
  end

  def create
    @professor = Professor.new(professor_params)
    @professor.user_id = current_user.id
    @professor.save
    respond_with(@professor)
  end

  def update
    @professor.update(professor_params)
    respond_with(@professor)
  end

  def destroy
    @professor.destroy
    respond_with(@professor)
  end

  private
  def set_professor
    @professor = Professor.find(params[:id])
  end
  
  def check_user_professor
    @user_has_professor = Professor.where(:user_id => current_user.id).first
    if @user_has_professor.present?
      redirect_to professors_path, notice: "Você já é cadastrado como professor"
    end
  end

  def professor_params
    params.require(:professor).permit(:user_id, :email, :price, :nota_pi, :nota_pf, :cr, :ranking, :horario)
  end
end
