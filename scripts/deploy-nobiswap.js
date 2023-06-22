const hre = require("hardhat");
const fs = require("fs");

async function main() {
  const TokenSwap = await ethers.getContractFactory("Nobyswap");

  const contractAddresses = [];

  for (let i = 0; i < 5; i++) {
    const tokenSwap = await TokenSwap.deploy();

    await tokenSwap.deployed();

    const contractAddress = tokenSwap.address;
    contractAddresses.push(contractAddress);

    console.log(`Contract ${i + 1} deployed to address:`, contractAddress);
  }

  // Write contract addresses to a JSON file
  const jsonData = JSON.stringify(contractAddresses, null, 2);
  fs.writeFileSync("contract_addresses.json", jsonData);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
