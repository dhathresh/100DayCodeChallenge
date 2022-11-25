require("@nomiclabs/hardhat-waffle");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const Private_Key = "ADD_YOUR_PRIVATE_KEY_HERE"

module.exports = {
  solidity: "0.8.13",
  networks: {
  	ropsten: {
  		url: `ADD_YOUR_QUICKNODE_URL_HERE`,
  		accounts: [`0x${Private_Key}`]
  	}
  }
};