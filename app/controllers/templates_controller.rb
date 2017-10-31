class TemplatesController < ApplicationController
  def new
    @template = Template.new
  end

  def index
  end

  def show
    @templates = Template.all
  end

  def create
    @template = Template.create(template_params)
    redirect_to :back
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    @template = Template.find(params[:id])
    @template.update(template_params)
  end

  private

  def template_params
    params.require(:template).permit(:title, :body)
  end
end
