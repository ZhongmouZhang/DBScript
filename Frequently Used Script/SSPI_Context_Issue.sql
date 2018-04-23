 
 Server name and IP Address mapping
 
 1) ping -a HostA  (and HostA.mydomain.com)
2) ping -a A.B.C.D  (If this only returns HostA, but not FQDN, usually means no DNS entry was found, and HostA is from Netbios)
3) nslookup
          >hostA.mydomain.com
          >hostA.mydomain.com
          >A.B.C.D
          >A.B.C.D