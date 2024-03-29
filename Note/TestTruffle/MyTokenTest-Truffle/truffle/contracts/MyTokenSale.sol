// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./CrowdSale.sol";
import "./KycContract.sol";
contract MyTokenSale is Crowdsale{
    KycContract kyc ;
    constructor(
        uint256 rate ,
        address payable wallet ,
        IERC20 token,
        KycContract _kyc
    )
        Crowdsale(rate,wallet,token)
        public
    {
        kyc = _kyc;
    }

        function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal view override {
            super._preValidatePurchase(beneficiary,weiAmount);
            require(kyc.Kyccompleted(beneficiary),"KYC is not completed yet, Please try again");
        }

}