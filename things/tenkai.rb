require 'http'
require 'json'
require 'open-uri'

def compromised(email, view_domains)
    r=HTTP.get("https://api.threatcop.com/api/tool/emailCheck?email=#{email}",:headers=>{"Content-Type"=>"application/json"})
    res=JSON.load(r.body)
    if res["success"]
        puts email
        if view_domains
            res["emailCheck"].length().times do |i|
                puts "\t"+res["emailCheck"][i]["Domain"]
            end
        end
    end
end

begin
    if File.exist?(ARGV[0])
        File.open(ARGV[0]).map{|x|x.chomp}.each do |y|
            compromised(y, ARGV[1]=="-d"?true:false)
        end
    elsif URI::MailTo::EMAIL_REGEXP.match?(ARGV[0])
        compromised(ARGV[0], ARGV[1]=="-d"?true:false)
    else
        raise TypeError
    end
rescue TypeError
    puts "Usage: ruby tenkai.rb [ email / emails-file ]\n\t-d (optional) view in which sites the email was found compromised"
rescue => e
    abort(e.to_s)
end
