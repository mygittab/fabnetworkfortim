
#!/bin/bash
fabric-ca-client enroll  -u https://admin:adminpw@ca.sim.blockchain.net:7054 --tls.certfiles /etc/hyperledger/fabric-ca-server-config/ca.sim.blockchain.net-cert.pem 
fabric-ca-client affiliation add sim  -u https://admin:adminpw@ca.sim.blockchain.net:7054 --tls.certfiles /etc/hyperledger/fabric-ca-server-config/ca.sim.blockchain.net-cert.pem 
