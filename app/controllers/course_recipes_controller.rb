class CourseRecipesController <
  RecipesController
  before_action :set_course

# This is inherited
  # def index
  #   get_recipes
  #   render 'recipes/index'
  # end

# Getting different data from this 'get_recipes'. Have to first check if course is nil otherwise we show the @course.recipes

protected
  def get_recipes
    if not @course.nil?
      @recipes = @course.recipes
      @message = "No Recipes Found" if @recipes.empty?
    end
  end

  def get_recipe
    if not @course.nil?
      @recipe = @course.recipes.find_by(id: params[:id])
      @message = "Can't find recipe with ID #{params[:id]}" if @recipes.nil?
    end
  end



private
  def set_course
    @course = Course.find_by(name: params[:course_id])
  if @course.nil?
      @recipes = []
      @recipe = nil
      @message = "Course can't be found"
    end
  end

# This gives us the course we want (using the ID from the URL params)

  def set_parent_path
    @parent_resource = "/courses"
    @parent_path = "/courses/#{params[:course_id]}"
  end
end



