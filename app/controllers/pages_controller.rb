class PagesController < ApplicationController  #Klasse PagesController erbt alle Objekte von der ApplicationController
  def home                                     #Definition der Methode Home
    @title = "Home"                            #Definition der Instanzvariablen @title
  end

end
