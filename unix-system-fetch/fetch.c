#include <stdio.h>
#include <sys/utsname.h>

void get_info(){
    struct utsname s;
    uname(&s);
    printf("\n System: %s %s, %s\n",s.sysname, s.version);
    printf("Hostname: %s, %s, %s\n", s.nodename, s.__domainname);
    printf("Kernel: %s\nCpu: %s\n\n", s.release, s.machine);
}

int main(){
    get_info();
    return 0;
}
