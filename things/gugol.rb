require 'nokogiri'
require 'open-uri'
require 'cgi'

def main(query)
    g = "https://google.com/search?q="
    begin
        search = Nokogiri::HTML(URI.open(g+=CGI.escape(query))).css("a[href]").map{|element|element["href"]}
        results = Array.new()
        puts "\nResults:\n"
        search.each do |link|
            Fiber.new {
                if link.start_with?("/search?", "/?sa=")
                    results.delete(link)
                else   
                    results.append(link)
                end
            Fiber.yield
            }.resume
        end
        results.each do |uwu|
            Fiber.new{
                if uwu.include?(query) || uwu.start_with?("/url?q")
                    puts uwu.gsub("/url?q=", "\n")
                end
            Fiber.yield
            }.resume
        end
    rescue => e  
        puts e
    end
end

print"search: "
main(gets.chomp)
