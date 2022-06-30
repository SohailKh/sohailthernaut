import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  for (let i = 0; i < 10; i++) {
    const attacked = await attacker.hackContract();
  }
};

export default helper;
