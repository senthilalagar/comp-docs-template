class TemplatesController < ApplicationController
  def new
    @template = Template.new
  end

  def index
  end

  def show
    @templates = Template.all
    binding.pry
  end

  def create
    @template = Template.create(template_params)
    redirect_to :back
  end

  private

  def template_params
    params.require(:template).permit(:title, :body)
  end
end
