require 'http'
require 'json'

def compromised(email, view_domains)
    r=HTTP.get("https://api.threatcop.com/api/tool/emailCheck?email=#{email}",:headers=>{"Content-Type"=>"application/json"})
    res=JSON.load(r.body)
    if res["success"]
        print "#{email} "
        if view_domains
            res["emailCheck"].length().times do |i|
                print res["emailCheck"][i]["Domain"]+" "
            end
        end
        puts
    end
end

begin
    email_list=File.open(ARGV[0])
    email_list.map{|x|x.chomp}.each do |y|
        compromised(y,ARGV[1]=="-d"?true:false)
    end
rescue TypeError
    puts "Usage: ruby tenkai.rb [emails-file]\n\t-d (optional) view in which sites the email was found compromised"
rescue => e
    abort(e.to_s)
end
