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
    @sinks = Sink.find(:all)
    @sinks.each { |si| printf(f, "t" + si.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "j / \n")
    @transport_links = TransportLink.find(:all)
    @transport_links.each { |li| printf(f, "t" + li.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")


    printf(f, "LI(l,i) = no;\n")
    printf(f, "LJ(l,j) = no;\n\n")

    @transport_links.each do |li|
      printf(f, "LI( 'l" + li.id.to_s + "', 'i" + li.source_id.to_s + "') = yes;\n")
      printf(f, "LJ( 'l" + li.id.to_s + "', 'j" + li.sink_id.to_s + "') = yes;\n\n")
    end
    printf(f, "\n\n")

    printf(f, "Parameter\n  A(i) /\n")

    @sources.each { |so| printf(f, "i" + so.id.to_s + "  " + so.supply_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nN(j) /\n")

    @sinks.each { |si| printf(f, "j" + si.id.to_s + "  " + si.demand_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nc(l) /\n")

    @transport_links.each { |li| printf(f, "l" + li.id.to_s + "  " + li.unit_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, ";\n")
    f.close


    if File.exist?("Transportmengen_v2.txt")
      File.delete("Transportmengen_v2.txt")
    end

    #system "C:\\Programme\\Gams Transportmodell v2"
    system "gams Transportmodell_v2"

    @transport_links = TransportLink.find(:all)
    render :template => "transport_links/index"
    end
end