// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8.10;

abstract contract CTokenInterface {
    function transfer(address dst, uint amount) external virtual returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint amount
    ) external virtual returns (bool);

    function approve(address spender, uint amount)
        external
        virtual
        returns (bool);

    function allowance(address owner, address spender)
        external
        view
        virtual
        returns (uint);

    function balanceOf(address owner) external view virtual returns (uint);

    function balanceOfUnderlying(address owner) external virtual returns (uint);

    function getAccountSnapshot(address account)
        external
        view
        virtual
        returns (
            uint,
            uint,
            uint,
            uint
        );

    function borrowRatePerBlock() external view virtual returns (uint);

    function supplyRatePerBlock() external view virtual returns (uint);

    function totalBorrowsCurrent() external virtual returns (uint);

    function borrowBalanceCurrent(address account)
        external
        virtual
        returns (uint);

    function borrowBalanceStored(address account)
        external
        view
        virtual
        returns (uint);

    function exchangeRateCurrent() external virtual returns (uint);

    function exchangeRateStored() external view virtual returns (uint);

    function getCash() external view virtual returns (uint);

    function accrueInterest() external virtual returns (uint);

    function seize(
        address liquidator,
        address borrower,
        uint seizeTokens
    ) external virtual returns (uint);

    function mint(uint mintAmount) external virtual returns (uint);

    function redeem(uint redeemTokens) external virtual returns (uint);

    function redeemUnderlying(uint redeemAmount)
        external
        virtual
        returns (uint);

    function borrow(uint borrowAmount) external virtual returns (uint);

    function repayBorrow(uint repayAmount) external virtual returns (uint);

    function repayBorrowBehalf(address borrower, uint repayAmount)
        external
        virtual
        returns (uint);

    function liquidateBorrow(
        address borrower,
        uint repayAmount,
        CTokenInterface cTokenCollateral
    ) external virtual returns (uint);
}
