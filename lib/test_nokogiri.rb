
require 'nokogiri'
require 'open-uri'

   
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
puts page.class   # => Nokogiri::HTML::Document


def create_bitcoin_array
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 
    bitcoin_array = []
    bitcoin = page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a')
    bitcoin.each do |bitcoin|
        bitcoin_array << bitcoin.text
    end
    puts bitcoin_array
    return bitcoin_array
end

def create_price_array
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 
    price_array = []
    price = page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a')
    price.each do |price|
        price_array << price.text.delete('$').to_f
    end
    puts price_array
    return price_array
end

def create_my_hash(bitcoin_array, price_array)
    my_hash = Hash.new
    my_hash = bitcoin_array.zip(price_array).map{|k,v|{bitcoin_array:k, price_array:v}}
    puts my_hash
end

def perform
    bitcoin_array = create_bitcoin_array
    price_array = create_price_array
    create_my_hash(bitcoin_array, price_array)
end

perform


def hello
    return "Hello World!"
  end

def remind_xpath
    page = Nokogiri::HTML(open("ton_url_a_scrapper.com")) #Ouvrir l'URL souhaitée sous Nokogiri et le stocker dans un objet page
    all_emails_links = page.xpath('/mettre_ici_le_XPath') #Extraire les éléments HTML que tu veux scrapper en utilisant leur XPath et en les stockant dans un array 
    page.xpath('//a') #récupérer tous les liens d'une page
    page.xpath('//h1') #Pour tous les titres h1
    page.xpath('//h1//a') #récupérer les liens situés sous un titre h1 (même s'ils sont inclus dans un paragraphe, lui-même imbriqué dans une div)
    page.xpath('//h1/a') #récupérer les liens situés DIRECTEMENT sous un titre h1 (sans élément intermédiaire)
    page.xpath('//h1[@class="primary"]/a[@id="email"]') #récupérer le lien ayant l'id email situé sous un titre h1 de classe primary,
    page.xpath('//a[contains(@href, "mailto")]').#récupérer tous les liens dont le href contient le mot "mailto"
    #tu veux récupérer le texte de chaque lien ? Il faut parcourir l'array et extraire le .text de chaque élément HTML
    all_emails_links.each do |email_link|
        puts email_link.text #ou n'importe quelle autre opération de ton choix ;)
        end
    email_link['href'] #récupérer le texte du href d'un élément HTML
end