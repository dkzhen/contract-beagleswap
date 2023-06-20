// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function claim() external;

    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    function balanceOf(address account) external view returns (uint256);
}

contract FaucetBeagleV1 {
    IERC20 public contractFaucet;
    IERC20 public usdtToken;
    IERC20 public usdcToken;
    address public owner;

    // Maximum amount of stablecoins (1 token)
    address private constant usdt = 0x6440c59d7c7c108d3Bb90E4bDeeE8262c975858a;
    address private constant usdc = 0xB37A5498A6386b253FC30863A41175C3f9c0723B;

    constructor(address _contractFaucet) {
        contractFaucet = IERC20(_contractFaucet);
        usdcToken = IERC20(usdc);
        usdtToken = IERC20(usdt);
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function claim() external {
        IERC20(contractFaucet).claim();
    }

    function mint(uint256 amount) external {
        require(
            usdcToken.balanceOf(address(this)) >= 1,
            "Insufficient USDC balance in the contract."
        );

        usdcToken.transfer(msg.sender, amount);

        require(
            usdtToken.balanceOf(address(this)) >= 1,
            "Insufficient USDT balance in the contract."
        );

        usdtToken.transfer(msg.sender, amount);
    }

    function claimAll(uint256 times) external {
        for (uint256 i = 0; i < times; i++) {
            IERC20(contractFaucet).claim();
        }
    }
}
