import { ethers } from "hardhat";
import { MoonCoin, MoonCoin__factory } from "../typechain-types";
import { expect } from "chai";

import dotenv from "dotenv";

dotenv.config();

const { NAME, SYMBOL, DECIMALS, TOTAL_SUPPLY } = process.env as unknown as {
  NAME: string;
  SYMBOL: string;
  DECIMALS: number;
  TOTAL_SUPPLY: number;
};

describe("MoonCoin", () => {
  let moonCoinFactory: MoonCoin__factory;
  let moonCoin: MoonCoin;

  before(async () => {
    moonCoinFactory = await ethers.getContractFactory("MoonCoin");
  });

  it("Should deploy the moon coin", async () => {
    moonCoin = await moonCoinFactory.deploy(
      NAME,
      SYMBOL,
      DECIMALS,
      TOTAL_SUPPLY
    );
    expect(await moonCoin.symbol()).be.equal("MOON");
  });

  it("Total supply should be 1_000_000", async () => {
    const totalSupply = await moonCoin.totalSupply();

    expect(totalSupply).be.equal(1_000_000);
  });
});
