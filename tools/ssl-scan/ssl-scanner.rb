require 'open-uri'
require 'rex/sslscan'

def ssl_scan
    begin 
        print "\n[?] Address: "
        remote_addr = gets.chomp
        begin
            sus = URI.open("https://#{remote_addr}")
            puts "[+] #{remote_addr} have ssl!"
        rescue OpenSSL::SSL::SSLError, Errno::EHOSTUNREACH => bruh             #yes... ingenious, right?
            puts "[!] #{remote_addr} haven't ssl: #{bruh}"
        rescue SocketError => e
            puts "[!] Enable to get connection at #{remote_addr}"
        end
        print "\r[?] Are you sure to continue? (y/n): "
        option = gets.chomp 
        if option == "y"
            scan = Rex::SSLScan::Scanner.new(remote_addr, 443)   #443: number of ssl port
            results = scan.scan
            print results.to_s
            log = File.new("scan.log", "a")
            log.write(results.to_s)
            puts "\r[!] Scan finished! Check scan.log file\n"
        elsif option == "n"
            puts "[*] Ok, Bye."
            exit()
        else 
            puts "\n[!] did you select the 'y' or the 'n' kiddo?"
        end
    rescue StandardError => err
        puts "\r[!] Error: You are retard\n#{err}"
    end
end
print ssl_scan
