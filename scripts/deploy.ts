import hre from "hardhat";

const CONTRACT_NAME = "PUT_CONTRACT_NAME_HERE"

const main = async () => {
    const contract = await hre.ethers.deployContract(CONTRACT_NAME);
    await contract.waitForDeployment();

    console.log(`Deployed plending machine to ${contract.target}`);
}

main().catch(e => console.error(e))