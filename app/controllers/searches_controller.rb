class SearchesController < ApplicationController
  def show
     @search = Search.find(params[:id])
  end
  
  def index
    @product = Search.ransack(params[:q])
    @searches = @product.result.where.not(id: 1)
  end
  
  def edit
    @search = Search.find(params[:id])
  end

  def update
    @search = Search.find(params[:id])    
    @search.update(update_params) 
    redirect_to search_path
  end
  
  
  def create
    @search = Search.new(update_params)
    @search.user_id = current_user.id
    @search.save
    redirect_to searches_path
  end
  
  def destroy
    search = Search.find(params[:id])    
    search.destroy
    redirect_to root_path
  end  
    
  def search
      @search = Search.new
    if postal_code = params[:postal_code]
      params = URI.encode_www_form({zipcode: postal_code})
      uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{params}")
      response = Net::HTTP.get_response(uri)
      result = JSON.parse(response.body)
      if result["results"]
        @zipcode = result["results"][0]["zipcode"]
        @address1 = result["results"][0]["address1"]
        @address2 = result["results"][0]["address2"]
        @address3 = result["results"][0]["address3"]
      end
    end
  end
end

private
 def search_params
  params.permit(:address1, :address2, :address3, :building_name,:phone_number, :postal_code,:family_name,:first_name,:family_name_kana,:family_name_kana,:first_name_kana,:sex_id,:age,:company,:position )
 end

 def update_params
  params.require(:search).permit(:address1, :address2, :address3, :building_name,:phone_number, :postal_code,:family_name,:first_name,:family_name_kana,:family_name_kana,:first_name_kana,:sex_id,:age,:company,:position)
 end