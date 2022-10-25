const MyDefiProject = artifacts.require("MyDefiDai");
const MyDefiUniswapV1 = artifacts.require("MyDefiUniswapV1");
const Dai = artifacts.require("Dai");

module.exports = async function (deployer, _network, account) {
  await deployer.deploy(Dai);
  const dai = await Dai.deployed();
  await deployer.deploy(MyDefiProject, dai.address);
  const myDefiProject = await MyDefiProject.deployed();

  await dai.faucet(myDefiProject.address, 100);
  await myDefiProject.foo(account[1], 100);

  const balance0 = await dai.balanceOf(myDefiProject.address);
  const balance1 = await dai.balanceOf(account[1]);

  console.log(balance0.toString());
  console.log(balance1.toString());

  //1 .  use kovan faucet to get ether
  //2- oasis to get some DAI
  //3- I need the address of the dai token in that testnet  in daitoken.md
  //4-  send some dai to the SC
  //5 - execute foo
  // deploy in infura and private key
};
