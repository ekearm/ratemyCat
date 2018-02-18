class CatsController < ApplicationController
	before_action :find_cat, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		if params[:cat_egory].blank?
			@cats = Cat.all.order("created_at DESC")
		else
			@cat_egory_id = CatEgory.find_by(name: params[:cat_egory]).id
			@cats = Cat.where(:cat_egory_id => @cat_egory_id).order("created_at DESC")
		end
	end

	def new
		@cat = current_user.cats.build
		@cat_egories = CatEgory.all.map{ |c| [c.name, c.id]}
	end

	def show
		if @cat.reviews.blank?
			@average_review = 0
		else
			@average_review = @cat.reviews.average(:rating).round(2)
		end
	end

	def create
		@cat = current_user.cats.build(cat_params)
		@cat.cat_egory_id = params[:cat_egory_id]

		if @cat.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@cat_egories = CatEgory.all.map{ |c| [c.name, c.id]}
	end

	def update
		@cat_egories = CatEgory.all.map{ |c| [c.name, c.id]}
		if @cat.update(cat_params)
			redirect_to cat_path(@cat)
		else
			render 'edit'
		end
	end

	def destroy
		@cat.destroy
		redirect_to root_path
	end

	private

	def cat_params
		params.require(:cat).permit(:name, :personality, :owner, :cat_egory_id, :cat_image)
	end

	def find_cat
		@cat = Cat.find(params[:id])
	end
end
