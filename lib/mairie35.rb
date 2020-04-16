require 'nokogiri'
require 'open-uri'

   
main_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/")) 
region_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/")) 
townhall_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html")) 
puts main_url.class   # => Nokogiri::HTML::Document


def create_emails_array
    townhall_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html")) 
    emails_array = []
    emails = townhall_url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
        emails.each do |email|
        emails_array << email.text
    end
    puts emails_array
    return emails_array
end

def perform
    emails_array = create_emails_array
end

perform