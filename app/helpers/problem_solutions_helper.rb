module ProblemSolutionsHelper
  def objective_function_value_response
    if @objective_function_value.nil?
      return "There is no objective function value!"
    else
      return "The objective function value is "+@objective_function_value + "!"
    end
  end

 #  def production_response
 #   if @production.nil?
 #     return "There is no optimal solution!"
 #   else
 #     return "The optimal solution is "+@production + "!"
 #   end
 # end
end
