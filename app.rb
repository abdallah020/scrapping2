

  require "json"
  require 'csv'

  require_relative 'lib/app/scrap_ministre'


  # Instancier la classe Scraper
  scraper = Scraper.new

  # Appeler la méthode scrap_ministre_name pour obtenir les données
  ministre_array = scraper.scrap_ministre_name

  # Écriture des données dans un fichier JSON
  File.open('db/ministres.json', 'w') do |f|
    f.write(JSON.pretty_generate(ministre_array))
  end

  puts "Données stockées dans le fichier ministres.json"
  
  
  # Écriture des données dans un fichier CSV
  CSV.open('db/ministres.csv', 'w', col_sep: ',', headers: ministre_array.first.keys) do |csv|
     # Écriture des en-têtes
     csv << ministre_array.first.keys

     # Écriture des données
     ministre_array.each do |ministre|
       csv << ministre.values
     end
  end

  puts "Données stockées dans le fichier ministres.csv"


