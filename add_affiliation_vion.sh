
#!/bin/bash
fabric-ca-client enroll  -u https://admin:adminpw@ca.vion.blockchain.net:7054 --tls.certfiles /etc/hyperledger/fabric-ca-server-config/ca.vion.blockchain.net-cert.pem 
fabric-ca-client affiliation add vion  -u https://admin:adminpw@ca.vion.blockchain.net:7054 --tls.certfiles /etc/hyperledger/fabric-ca-server-config/ca.vion.blockchain.net-cert.pem 
