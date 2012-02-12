class ProblemSolutionsController < ApplicationController
  def index
    @title = "Data Input & Solution"
  end

  def optimize

    if File.exist?("mlclsp_include_instanz.inc")
      File.delete("mlclsp_include_instanz.inc")
    end
    f=File.new("mlclsp_include_instanz.inc", "w")
    printf(f, "set k / \n")
    @products = Product.find(:all)
    @products.each { |so| printf(f, "k" + so.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "t / \n")
    @periods = Period.find(:all)
    @periods.each { |si| printf(f, "t" + si.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "j / \n")
    @resources = Resource.find(:all)
    @resources.each { |li| printf(f, "j" + li.resource_name.to_s + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "alias(k,i);\n")
    printf(f, "Set NF(k,i) ;\n")
    printf(f, "NF(k,i)= no;\n")

    @follower_products = FollowerProduct.find(:all)
    @follower_products.each do |li|
    printf(f, "NF( 'k" + li.follower_id.to_s + "', 'k" + li.product_id.to_s + "') = yes;\n")

    end
    printf(f, "Set PR(k,j) ;\n\n")
    printf(f, " PR(k,j)=  no ;\n\n")

    @products.each do |li|
    printf(f, "PR( 'k" + li.id.to_s + "', 'j" + li.resource.to_s + "') = yes;\n\n")
    end

    printf(f, "\n\n")

    printf(f, "Parameter\n  h(k) /\n")

    @products.each { |so| printf(f, "k" + so.id.to_s + "  " + so.storage_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ns(k) /\n")

    @products.each { |si| printf(f, "k" + si.id.to_s + "  " + si.setup_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ntb(k) /\n")

    @products.each { |li| printf(f, "k" + li.id.to_s + "  " + li.working_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ntr(k) /\n")

    @products.each { |li| printf(f, "k" + li.id.to_s + "  " + li.setup_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nz(k) /\n")

    @products.each { |li| printf(f, "k" + li.id.to_s + "  " + li.leadtime_shift.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ny0(k) /\n")

    @products.each { |li| printf(f, "k" + li.id.to_s + "  " + li.start_inventory.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\na(k,i) /\n")

    @follower_products.each { |ve|
    printf(f, "k" + ve.product_id.to_s + ".k" + ve.follower_id.to_s + " " + ve.coefficient.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nb(j,t) /\n")
    @resource_periods = ResourcePeriod.find(:all)
    @resource_periods.each { |ve|
    printf(f, "j" + ve.resource_id.to_s + ".t" + ve.period_id.to_s + " " + ve.capacity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nd(k,t) /\n")
    @demands = Demand.find(:all)
    @demands.each { |ve|
    printf(f, "k" + ve.product_id.to_s + ".t" + ve.period_id.to_s + " " + ve.demand_quantity.to_s + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "Scalar M;\n M = 10000;\n")


    f.close



    if File.exist?("mlclsp_solution.txt")
      File.delete("mlclsp_solution.txt")
    end

   # system "C:\\Programme\\Gams mlclsp"
    system "gams mlclsp"

    @problem_solutions = ProblemSolution.find(:all)
    render :template => "problem_solutions/index"
  end


  def delete_production_quantities
    @problem_solutions = ProblemSolution.all
     @problem_solutions.each {|problem_solutions|
       problem_solutions.production_quantity=0.0
     problem_solutions.save}

    @inventory_solutions = InventorySolution.all
     @inventory_solutions.each {|inventory_solutions|
       inventory_solutions.inventory=0.0
     inventory_solutions.save}

    render :template => "problem_solutions/index"
  end

  def read_and_show_ofv

     if File.exist?("Objective_F_Value.txt")
       fi=File.open("Objective_F_Value.txt", "r")
       line=fi.readline
       fi.close
       sa=line.split(" ")
       @objective_function_value=sa[1]
     else
       @objective_function_value=nil
     end
    # @problem_solutions = ProblemSolution.find(:all)
     render :template => "problem_solutions/index"
   end


   def read_production_quantities
     @problem_solutions = ProblemSolution.all
     @problem_solutions.each {|problem_solutions|
       problem_solutions.destroy}

      fi=File.open("mlclsp_solution_1.txt", "r")
      fi.each {|li|
      sa=li.split(";")
      sa0=sa[0].delete "k "
      sa1=sa[1].delete "t "
      sa2=sa[2].delete " "

      @problem_solutions =ProblemSolution.new
      @problem_solutions.product_name=sa0
      @problem_solutions.period_name=sa1
      @problem_solutions.production_quantity=sa2
      @problem_solutions.save
     }

     fi.close

     @inventory_solutions = InventorySolution.all
     @inventory_solutions.each {|inventory_solutions|
       inventory_solutions.destroy}

      fi=File.open("mlclsp_solution_2.txt", "r")
      fi.each {|li|
      sa=li.split(";")
      sa0=sa[0].delete "k "
      sa1=sa[1].delete "t "
      sa2=sa[2].delete " "

      @inventory_solutions = InventorySolution.new
      @inventory_solutions.product_name=sa0
      @inventory_solutions.period_name=sa1
      @inventory_solutions.inventory=sa2
      @inventory_solutions.save
     }

     fi.close
     render :template => "problem_solutions/index"
   end


end

