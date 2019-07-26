class PropertysController < ApplicationController
before_action :set_property, only:[:show,:edit,:update,:destroy]
  def index
    @property = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.nearests.build }
  end

  def create
    @property = Property.new(property_params)
    binding.pry
    if @property.save
      redirect_to propertys_path
    else
      render 'new'
    end
  end

  def destroy
    @property.destroy
    #redirect_to pictures_path, notice: "ブログを作成しました！"
    redirect_to propertys_path
  end

  private

  def property_params
    params.require(:property).permit(:name,:price,:address,:age,:remarks,
      nearests_attributes: [:id,:route_name,:station,:time])
  end

  def set_property
    @property = Property.find(params[:id])
  end

end
