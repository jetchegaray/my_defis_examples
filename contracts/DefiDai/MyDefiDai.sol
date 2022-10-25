pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyDefiDai {
    IERC20 dai;

    constructor(address daiAddress) public {
        dai = IERC20(daiAddress);
    }

    function foo(address recipient, uint amount) external {
        dai.transfer(recipient, amount); //100 cents .. 100 really would be 18 zeros ..  100 000 000 000 000 000 000
    }
}
