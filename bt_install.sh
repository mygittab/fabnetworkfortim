#!/bin/bash
. setpeer.sh Vion peer0 
export CHANNEL_NAME="vionsim"
peer chaincode install -n bt -v 1.0 -l golang -p  github.com/bt
. setpeer.sh Sim peer0 
export CHANNEL_NAME="vionsim"
peer chaincode install -n bt -v 1.0 -l golang -p  github.com/bt
peer chaincode instantiate -o orderer0.blockchain.net:7050 --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C vionsim -n bt -v 1.0 -c '{"Args":["init",""]}' -P " OR( 'VionMSP.member','SimMSP.member' ) " 
