pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "./ComptrollerInterface.sol";
import "./cTokenInterface.sol";

contract MyDefiCompound {
    IERC20 dai;
    CTokenInterface cDai;
    IERC20 bat;
    CTokenInterface cBat;
    ComptrollerInterface comptroller;

    constructor(
        address _dai,
        address _cDai,
        address _bat,
        address _cBat,
        address _comptroller
    ) {
        dai = IERC20(_dai);
        cDai = CTokenInterface(_cDai);
        bat = IERC20(_bat);
        cBat = CTokenInterface(_cBat);
        comptroller = ComptrollerInterface(_comptroller);
    }

    function invest() external {
        dai.approve(address(cDai), 10000); // allow our token dai to transfer
        cDai.mint(10000); // intenally calls dai.transferFrom .. now we have cDain and we can earn interests
    }

    function cashOut() external {
        uint balance = cDai.balanceOf(address(this)); // we can not assume that we have 10000.
        cDai.redeem(balance);
    }

    function borrow() external {
        dai.approve(address(cDai), 10000); // allow our token dai to transfer
        cDai.mint(10000); // intenally calls dai.transferFrom .. now we have cDain and we can earn interests

        address[] memory markets = new address[](1);
        markets[0] = address(cDai);
        comptroller.enterMarkets(markets);

        cBat.borrow(100); // you have to consider that the value of the collateral should be superior that cBat, and collateral factor
        // it tells how much collateral you need to have to borrow some token it is specific for each market.
    }

    function payback() external {
        dai.approve(address(cBat), 200); // allow our token bat to transfer, 100 plus interests
        cBat.repayBorrow(100); // finish your loan

        //optional you can get back your collateral
        uint balance = cDai.balanceOf(address(this)); // we can not assume that we have 10000.
        cDai.redeem(balance);
    }
}
