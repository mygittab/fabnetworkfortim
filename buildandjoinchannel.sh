
#!/bin/bash -e




	
	echo "Building channel for vionsim" 
	
	. setpeer.sh Vion peer0
	export CHANNEL_NAME="vionsim"
	peer channel create -o orderer0.blockchain.net:7050 -c $CHANNEL_NAME -f ./vionsim.tx --tls true --cafile $ORDERER_CA -t 1000s
	
		
        
            . setpeer.sh Vion peer0
            export CHANNEL_NAME="vionsim"
			peer channel join -b $CHANNEL_NAME.block
		
	
		
        
            . setpeer.sh Sim peer0
            export CHANNEL_NAME="vionsim"
			peer channel join -b $CHANNEL_NAME.block
		
	
	
	
	
		. setpeer.sh Vion peer0
		export CHANNEL_NAME="vionsim"
		peer channel update -o  orderer0.blockchain.net:7050 -c $CHANNEL_NAME -f ./vionsimVionMSPAnchor.tx --tls --cafile $ORDERER_CA 
	

	
	
		. setpeer.sh Sim peer0
		export CHANNEL_NAME="vionsim"
		peer channel update -o  orderer0.blockchain.net:7050 -c $CHANNEL_NAME -f ./vionsimSimMSPAnchor.tx --tls --cafile $ORDERER_CA 
	




