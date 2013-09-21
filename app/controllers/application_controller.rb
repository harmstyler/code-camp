class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# Check if the current slug is not the cannonical one.
  def bad_slug?(object)
    params[:slug] != object.slug
  end

  # 301 redirect to canonical slug.
  def redirect_to_good_slug(object)
      redirect_to params.merge({
                    :controller => controller_name,
                    :action => params[:action],
                    :slug => object.slug,
                    :id => object.id,
                    :status => :moved_permanently
                  })
  end
end
