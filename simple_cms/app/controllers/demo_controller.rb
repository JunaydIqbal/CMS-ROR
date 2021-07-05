class DemoController < ApplicationController
  layout =false
  def index
    @array = [2,4,6,8,10,11]
    render('index')
  end

  def about
    render('about')
    @id = params['id']
    @page = params[:page]
    #redirect_to(:controller => 'demo', :action => 'index')
  end
end
