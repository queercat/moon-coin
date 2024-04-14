import hre from "hardhat";
import dotenv from "dotenv";

dotenv.config();

const { NAME, SYMBOL, DECIMALS, TOTAL_SUPPLY } = process.env as unknown as {
  NAME: string;
  SYMBOL: string;
  DECIMALS: number;
  TOTAL_SUPPLY: number;
};

const main = async () => {
  const moonCoinFactory = await hre.ethers.getContractFactory("MoonCoin");
  const moonCoin = await moonCoinFactory.deploy(
    NAME,
    SYMBOL,
    DECIMALS,
    TOTAL_SUPPLY
  );

  console.log(`Deployed MoonCoin to ${moonCoin.target}`);
};

main().catch((e) => console.error(e));
