class ProblemSolutionsController < ApplicationController
  def index
  end

  def optimize

    if File.exist?("mlclsp_include_instanz_4.inc")
      File.delete("mlclsp_include_instanz_4.inc")
    end
    f=File.new("mlclsp_include_instanz_4.inc", "w")
    printf(f, "set k / \n")
    @products = Product.find(:all)
    @products.each { |so| printf(f, "k" + so.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "t / \n")
    @demands = Demand.find(:all)
    @demands.each { |si| printf(f, "t" + si.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "j / \n")
    @resources = Resource.find(:all)
    @resources.each { |li| printf(f, "t" + li.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "alias(k,i);\n")
    printf(f, "NF(k,i) = no;\n")


    @dependencies.each do |li|
      printf(f, "NF( 'k" + li.product_name.to_s + "', 'i" + li.follower.to_s + "') = yes;\n")

    end
      printf(f, "PR(k,j) = no;\n\n")

    @products.each do |li|
      printf(f, "PR( 'k" + li.product_name.to_s + "', 'j" + li.resource.to_s + "') = yes;\n\n")
    end

    printf(f, "\n\n")

    printf(f, "Parameter\n  h(k) /\n")

    @products.each { |so| printf(f, "k" + so.product_name.to_s + "  " + so.storage_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ns(k) /\n")

    @products.each { |si| printf(f, "k" + si.product_name.to_s + "  " + si.setup_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ntb(k) /\n")

    @products.each { |li| printf(f, "k" + li.product_name.to_s + "  " + li.working_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ntr(k) /\n")

    @products.each { |li| printf(f, "k" + li.product_name.to_s + "  " + li.setup_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nz(k) /\n")

    @products.each { |li| printf(f, "k" + li.product_name.to_s + "  " + li.leadtime_shift.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ny0(k) /\n")

    @products.each { |li| printf(f, "k" + li.product_name.to_s + "  " + 0.to_s + "\n") }
    printf(f, "/" + "\n\n")



    printf(f, ";\n")
    f.close


    if File.exist?("mlclsp_solution.txt")
      File.delete("mlclsp_solution.txt")
    end

    #system "C:\\Programme\\Gams Transportmodell v2"
    system "gams mlclsp"

    @product_solutions = ProductSolution.find(:all)
    render :template => "problem_solutions/index"
  end

def read_transportation_quantities

    fi=File.open("mlclsp_solution.txt", "r")
    fi.each { |line| # printf(f,line)
      sa=line.split(";")
      sa0=sa[0].delete "l "
      sa3=sa[3].delete " \n"
      al=TransportLink.find_by_id(sa0)
      al.transport_quantity=sa3
      al.save

    }

    fi.close


    @product_solutions = ProductSolution.find(:all)
    render :template => "problem_solutions/index"

  end

end