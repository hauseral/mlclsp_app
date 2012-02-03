module ApplicationHelper
 # Return a title on a per-page basis.
  def title                         #Definition der Methode title
    base_title = "MLCLSP App"       #Zuweisung der Ausprägung MLCLSP App der Variable base_title
    if @title.nil?                  #boolsche Abfrage der Instanzvariablen bezüglich der Existenz eines Inhalts
      base_title                    #Ausgabe der vordefinierten Variablen beim fehlenden Inhalt (falls @title.nil->true)
    else
      "#{base_title} | #{@title}"   #Interpolation der Variablen zu einem String (@title.nil?->false)
    end
  end
end