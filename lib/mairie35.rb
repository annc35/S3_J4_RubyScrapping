require 'rubygems'
require 'nokogiri'
require 'open-uri'

   
main_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/")) 
region_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html")) 
region_url_basic = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/"))
townhall_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html")) 
puts main_url.class   # => Nokogiri::HTML::Document





def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(open(townhall_url)) 
    email_array = []
    email_array << {page.xpath('//*[contains(text(), "Adresse mairie de")]').text.split[3] => page.xpath('//*[contains(text(), "@")]').text} 
    puts email_array
    return email_array
end   
 
def get_townhall_urls #on aspire toutes les villes du Val d'Oise
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    url_array = []
    page.xpath('//*[@class="lientxt"]/@href').each do |url| #Mise en forme url + aspire du 2ème au dernier caractère
        url_array << "http://annuaire-des-mairies.com" + url.text[1..-1]        
    end
    return url_array 
end

def mairie_christmas
    get_townhall_urls.each do |townhall_url| 
        get_townhall_email(townhall_url)
    end
end 





def perform
  mairie_christmas
end

perform