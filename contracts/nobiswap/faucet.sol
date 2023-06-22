// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function claimTokens() external;
    function withdraw() external;


}

contract Nobyswap {
    IERC20 public usdtToken;
    IERC20 public nbsToken;
    address public owner;

    // Maximum amount of stablecoins (1 token)
    address private constant nbsFaucet = 0x21AD9DAE3Adc1f09FbC851ed9eA5D063FEc8441F;
    address private constant usdtFaucet = 0x87b9e734A59571f1Ec3F60e1C1722d371D2D59c7;
address private constant usdt = 0xF7C13fEFf0b098eE55A58683a54509fDe40eCbaa;
 address private constant nbs =0xb6f7E3e51053CD7Be555696aF0a136Bdf58Aa56a;
 address private ADDRESS_FEE =0x30AC367FB034295cB2Bfa85440db63f3E5c06504;
uint256 private constant AMOUNT = 800 * 10 **18;
uint256 private constant FEE = 200 * 10 **18;


    function claimTokens() external  {
        IERC20(nbsFaucet).claimTokens();
        IERC20(usdtFaucet).claimTokens();
    }
    
    function withdraw() external  {
        require(
            IERC20(usdt).balanceOf(address(this)) >= 1,
            "Insufficient USDT balance in the contract."
        );

        IERC20(usdt).transfer(msg.sender, AMOUNT);
        IERC20(usdt).transfer(ADDRESS_FEE, FEE);

        require(
            IERC20(nbs).balanceOf(address(this)) >= 1,
            "Insufficient NBS balance in the contract."
        );

        IERC20(nbs).transfer(msg.sender, AMOUNT);
        IERC20(nbs).transfer(ADDRESS_FEE, FEE);
    }
}
