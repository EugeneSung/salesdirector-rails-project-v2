class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:edit, :update, :destroy, :new, :create]

  def index
    @items = Item.all
  end
  def new
    @item = Item.new

  end
def show

end
def edit
end
def create



  @item = Item.new(item_params)

  if(@item.valid? and @item.save)

        flash[:notice] = "Item created successfully"

        redirect_to item_path(@item)

    else
        flash[:error] = @item.errors.full_messages.to_sentence
        redirect_to action: "new"
    end

end

def update
  respond_to do |format|
    if @item.update(item_params)
      format.html { redirect_to @item, notice: 'Item was successfully updated.' }
    else
      flash[:error] = @item.errors.full_messages.to_sentence
      format.html { render :edit }
    end
  end
end

def destroy
  @item.destroy
  respond_to do |format|
    format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
  end
end


private

def item_params
  params.require(:item).permit(:name, :item_type, :desc, :price, :inventory)
end
def set_item
  @item = Item.find(params[:id])
end

end
