pragma solidity ^0.5.4;
import "../wallet/BaseWallet.sol";

/**
 * @title Interface for a contract that can invest tokens in order to earn an interest.
 * @author Julien Niset - <julien@argent.xyz>
 */
interface Invest {

    /**
     * @dev Invest tokens for a given period.
     * @param _wallet The target wallet.
     * @param _tokens The array of token address.
     * @param _amounts The amount to invest for each token.
     * @param _period The period over which the tokens may be locked in the investment (optional).
     * @param _oracles (optional) The address of one or more oracles contracts that may be used by the provider to query information on-chain.
     * @return The exact amount of each tokens that have been invested. 
     */
    function addInvestment(
        BaseWallet _wallet, 
        address[] calldata _tokens, 
        uint256[] calldata _amounts, 
        uint256 _period, 
        address[] calldata _oracles
    ) 
        external
        returns (uint256[] memory _invested);

    /**
     * @dev Exit invested postions.
     * @param _wallet The target wallet.
     * @param _tokens The array of token address.
     * @param _fraction The fraction of invested tokens to exit in per 10000. 
     * @param _oracles (optional) The address of one or more oracles contracts that may be used by the provider to query information on-chain.
     */
    function removeInvestment(
        BaseWallet _wallet, 
        address[] calldata _tokens, 
        uint256 _fraction, 
        address[] calldata _oracles
    ) 
        external;

    /**
     * @dev Get the amount of investment in a given token.
     * @param _wallet The target wallet.
     * @param _token The token address.
     * @param _oracles (optional) The address of one or more oracles contracts that may be used by the provider to query information on-chain.
     * @return The value in tokens of the investment (including interests) and the time at which the investment can be removed.
     */
    function getInvestment(
        BaseWallet _wallet, 
        address _token, 
        address[] calldata _oracles
    ) 
        external 
        view 
        returns (uint256 _tokenValue, uint256 _periodEnd);
}