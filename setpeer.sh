
#!/bin/bash
export ORDERER_CA=/opt/ws/crypto-config/ordererOrganizations/blockchain.net/msp/tlscacerts/tlsca.blockchain.net-cert.pem

#For fabric 2.2.x extra environment variables

export VION_PEER0_CA=/opt/ws/crypto-config/peerOrganizations/vion.blockchain.net/peers/peer0.vion.blockchain.net/tls/ca.crt

export SIM_PEER0_CA=/opt/ws/crypto-config/peerOrganizations/sim.blockchain.net/peers/peer0.sim.blockchain.net/tls/ca.crt



if [ $# -lt 2 ];then
	echo "Usage : . setpeer.sh Vion|Sim| <peerid>"
fi
export peerId=$2

if [[ $1 = "Vion" ]];then
	echo "Setting to organization Vion peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.vion.blockchain.net:7051
	export CORE_PEER_LOCALMSPID=VionMSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/vion.blockchain.net/peers/$peerId.vion.blockchain.net/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/vion.blockchain.net/peers/$peerId.vion.blockchain.net/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/vion.blockchain.net/peers/$peerId.vion.blockchain.net/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/vion.blockchain.net/users/Admin@vion.blockchain.net/msp
fi

if [[ $1 = "Sim" ]];then
	echo "Setting to organization Sim peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.sim.blockchain.net:7051
	export CORE_PEER_LOCALMSPID=SimMSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/sim.blockchain.net/peers/$peerId.sim.blockchain.net/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/sim.blockchain.net/peers/$peerId.sim.blockchain.net/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/sim.blockchain.net/peers/$peerId.sim.blockchain.net/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/sim.blockchain.net/users/Admin@sim.blockchain.net/msp
fi

	