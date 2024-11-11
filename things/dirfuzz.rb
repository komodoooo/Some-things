require 'net/http'
require 'open-uri'
require 'openssl'

$a=0            #disable SSL verification
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

def fuzzer(link, wordlist)
    wordlist = File.open(wordlist)
    ohyes = wordlist.map {|x| x.chomp }
    link.delete_suffix!("/") unless link[-1..-1] != "/"
    ohyes.each do |dir|
        uriiii = URI("#{link}/#{dir}/")
        requestt = Net::HTTP.get_response(uriiii)
        if requestt.code == '200'
            puts "\ndirectory open! '#{dir}'"
            log = File.new("valid.log", "a")
            log.write(dir+"\n")
            log.close()
            puts "saved on valid.log file"
        elsif requestt.code != '404'
            puts "\ndirectory: '#{dir}' code: #{requestt.code}"
        else
            ($a%2==0)?(print"\b%"):(print"\b#")
            $a+=1      #cool waiting animation
        end
    end
end

begin
    print "URL: "
    url=gets.chomp
    print "Wordlist: "
    fuzzer(url, gets.chomp)
rescue => e
    puts e
end
