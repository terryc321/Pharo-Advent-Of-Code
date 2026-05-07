# Oauth slop

In Pharo Smalltalk, handling OAuth and HTTPS requests primarily relies on the Zinc HTTP Components library, enhanced with the Zodiac package for secure SSL/TLS support. 

# HTTPS Support
While earlier versions of Zinc lacked native HTTPS support, the current standard approach involves installing the SqueakSSL plugin and loading the Zodiac package.  This combination allows Zinc to establish secure connections without requiring external tools like stunnel. 

To enable HTTPS, you must configure the networking utils to use the Zodiac socket factory:


```
"Load Zinc HTTP Components"
Gofer it 
  squeaksource: 'ZincHTTPComponents'; 
  package: 'Zinc-HTTP'; 
  load. 

"Load Zodiac for SSL support"
Gofer it 
  squeaksource: 'Zodiac'; 
  package: 'Zodiac-Core'; 
  load.

"Load extra Zinc support for Zodiac"
Gofer it 
  squeaksource: 'ZincHTTPComponents'; 
  package: 'Zinc-Zodiac'; 
  load.

"Switch to the Zn Zodiac socket factory"
ZnNetworkingUtils default: ZnZodiacNetworkingUtils new.
```


# OAuth Implementation
For OAuth (both 1.0 and 2.0), the ecosystem has evolved from the older CloudforkSSO library to Zinc-SSO. 

# Zinc-SSO

This is a project under development that integrates OAuth and OpenID support directly into Zinc HTTP Components. It supports OAuth 2.0 and has been used in live demos for Google, Facebook, and Microsoft authentication. 
CloudforkSSO: An older library that supported OpenID2 and OAuth 1.0, often used with Seaside. It required workarounds like stunnel for HTTPS before Zodiac became the standard. 

To use OAuth, developers typically utilize the ZnClient class for making requests, setting the https flag and providing the necessary OAuth headers (consumer key, token, signature, etc.) as demonstrated in Twitter API integration examples.  For complex flows, the Zinc-SSO alpha code provides higher-level abstractions for authentication and token management.

