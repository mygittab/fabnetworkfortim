
#!/bin/bash -e
export PWD=`pwd`

export FABRIC_CFG_PATH=$PWD
export ARCH=$(uname -s)
export CRYPTOGEN=$PWD/bin/cryptogen
export CONFIGTXGEN=$PWD/bin/configtxgen

function generateArtifacts() {
	
	echo " *********** Generating artifacts ************ "
	echo " *********** Deleting old certificates ******* "
	
        rm -rf ./crypto-config
	
        echo " ************ Generating certificates ********* "
	
        $CRYPTOGEN generate --config=$FABRIC_CFG_PATH/crypto-config.yaml
        
        echo " ************ Generating tx files ************ "
	
		$CONFIGTXGEN -profile OrdererGenesis -channelID system-channel -outputBlock ./genesis.block
		
		$CONFIGTXGEN -profile Vionsim -outputCreateChannelTx ./vionsim.tx -channelID vionsim
		
		echo "Generating anchor peers tx files for  Vion"
		$CONFIGTXGEN -profile Vionsim -outputAnchorPeersUpdate  ./vionsimVionMSPAnchor.tx -channelID vionsim -asOrg VionMSP
		
		echo "Generating anchor peers tx files for  Sim"
		$CONFIGTXGEN -profile Vionsim -outputAnchorPeersUpdate  ./vionsimSimMSPAnchor.tx -channelID vionsim -asOrg SimMSP
		

		

}
function generateDockerComposeFile(){
	OPTS="-i"
	if [ "$ARCH" = "Darwin" ]; then
		OPTS="-it"
	fi
	cp  docker-compose-template.yaml  docker-compose.yaml
	
	
	cd  crypto-config/peerOrganizations/vion.blockchain.net/ca
	PRIV_KEY=$(ls *_sk)
	cd ../../../../
	sed $OPTS "s/VION_PRIVATE_KEY/${PRIV_KEY}/g"  docker-compose.yaml
	
	
	cd  crypto-config/peerOrganizations/sim.blockchain.net/ca
	PRIV_KEY=$(ls *_sk)
	cd ../../../../
	sed $OPTS "s/SIM_PRIVATE_KEY/${PRIV_KEY}/g"  docker-compose.yaml
	
}
generateArtifacts 
cd $PWD
generateDockerComposeFile
cd $PWD


mkdir ca-vion 
touch ca-vion/fabric-ca-server.db


mkdir ca-sim 
touch ca-sim/fabric-ca-server.db


