# encoding: utf-8
class EntriesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  before_filter :admin_user, only: [:new, :create, :edit, :update, :destroy, :index]

  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = current_user.entries.build(entry_params)
      if @entry.save
        redirect_to '/admin', notice: 'Product was successfully created.'
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
  end
  
  def update
    @entry = Entry.find(params[:id])
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end

  private
    def entry_params
      params.require(:entry).permit(:title, :description, :price, :link, :category_id, :image)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end