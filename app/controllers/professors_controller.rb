class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy,:recommended, :unrecommended]
  before_action :check_user_professor, only: [:new, :create]
  before_action :check_security, only: [:edit, :update, :destroy, :create]
  before_action :check_user_liker, only: [:recommended, :unrecommended]


  respond_to :html

  def index
    @professors = Professor.all.order("created_at desc").page(params[:page]).per(70)
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

  def unrecommended
    current_user.toggle_follow!(@professor)
    @professor.unrecommended_count = @professor.followers(User).count
    @professor.save!
    respond_to do |format|               
      format.js
    end
  end

  def recommended
    current_user.toggle_like!(@professor)
    @professor.recommended_count = @professor.likers(User).count
    @professor.save!
    respond_to do |format|               
      format.js
    end
  end

  private
  def set_professor
    @professor = Professor.friendly.find(params[:id])
  end
  
  def check_user_professor
    if current_user 
      @user_has_professor = Professor.where(:user_id => current_user.id).first
      if @user_has_professor.present?
        redirect_to professors_path, notice: "Você já é cadastrado como professor"
      end
    else
      redirect_to  new_user_session_path, notice: "Você precisa estar logado"
    end
  end

  def check_user_liker
    unless current_user
      redirect_to  new_user_session_path, notice: "Você precisa estar logado"
    end
  end

  def check_security
    if @user_has_professor = Professor.where(:user_id => current_user.id).first.id != current_user.id && current_user.admin == false || current_user.present? == false
      redirect_to root_path, notice: "Você não é o dono do cadastro !!"
    end
  end

  def professor_params
    params.require(:professor).permit(:name,:user_id, :email, :price, :nota_pi, :nota_pf, :cr, :ranking, :horario, :image, :major, :semester,:description, courses_attributes: [:id, :name,:nota_pf,:nota_pi, :done, :_destroy])
  end
end
