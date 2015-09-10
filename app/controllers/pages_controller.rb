class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :delivery, :about, :contacts]
  before_filter :admin_user, only: [:admin]
  def home
  	@home_page = true
  end

  def delivery
  end

  def about
  end

  def contacts
  end

  def admin
    @categories = Category.all
    @entries = Entry.all
  end

  private

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end