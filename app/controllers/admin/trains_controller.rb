class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

    respond_to do |format|
      format.html do
        if @train.save
          redirect_to [:admin, @train], notice: 'Train was successfully created.'
        else
          render :new
        end
      end
    end
  end

  def update
    respond_to do |format|
      format.html do
        if @train.update(train_params)
          redirect_to [:admin, @train], notice: 'Train was successfully updated.'
        else
          render :edit
        end
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to admin_trains_url, notice: 'Train was successfully destroyed.' }
    end
  end

  private
    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      params.require(:train).permit(:number, :current_station_id, :route_id)
    end
end
