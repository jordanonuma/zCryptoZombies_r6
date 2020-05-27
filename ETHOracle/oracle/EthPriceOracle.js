const axios = require('axios')
const BN = require('bn.js')
const common = require('./utils/common.js')
const SLEEP_INTERVAL = process.env.SLEEP_INTERVAL || 2000
const PRIVATE_KEY_FILE_NAME = process.env.PRIVATE_KEY_FILE || './oracle/oracle_private_key'
const CHUNK_SIZE = process.env.CHUNK_SIZE || 3
const MAX_RETRIES = process.env.MAX_RETRIES || 5
const OracleJSON = require('./oracle/build/contracts/EthPriceOracle.json')
var pendingRequests = []

async function getOracleContract(web3.js) {
    const networkId = await web3js.eth.net.getId()
    return new web3js.eth.Contract(OracleJSON.abi, OracleJSON.networks[networkId].address)
} //end function getOracleContract()

async function filterEvents(oracleContract, web3js) {
    EthPriceOracle.events.GetLatestEthPriceEvent(async (err, event) => {
        if (err) {
            console.error('Error on event', err)
            return
        } //end if()
        async function await addRequestToQueue(event) {
        
        } //end function addRequestToQueue()
      }) //end else()
    
    } //end filtering GetLatestEthPriceEvent()
} //end function filterEvents()