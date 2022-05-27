/**
 *Submitted for verification at BscScan.com on 2022-05-20
*/

// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.10;

/*

CryptoHealth BSC Token is a pioneer for medical reimbursement, cryptodonations
and utilities centered around the medical field. Check us out:

Telegram Portal: t.me/cryptohealth_official
Website: www.cryptohealth.life
Twitter: twitter.com/CryptoHealthBSC

Note: First contract had Exclude from Limits deleted as a safety feature, backfired for the presale :(
Please support our long term project! :-)

*/

pragma solidity >=0.6.2;

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

pragma solidity >=0.6.2;

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

pragma solidity >=0.5.0;

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}

pragma solidity ^0.8.0;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

pragma solidity ^0.8.0;

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        _transferOwnership(_msgSender());
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

pragma solidity ^0.8.1;

library Address {
    
    function isContract(address account) internal view returns (bool) {
       
        return account.code.length > 0;
    }

    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, "Address: low-level call failed");
    }

    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
                if (returndata.length > 0) {
    
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

pragma solidity ^0.8.0;

library SafeMath {
    
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {

            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

pragma solidity ^0.8.0;

interface IERC20 {
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

contract CRYPTOHEALTH is Context, IERC20, Ownable {
    using SafeMath for uint256;
    using Address for address;

    mapping(address => uint256) private _rOwned; //Tokens Reflected
    mapping(address => uint256) private _tOwned; //Tokens Owned
    mapping(address => mapping(address => uint256)) private _allowances;
    
    mapping(address => bool) public _isDonationRecipient; //Wallet with specific transfer requirements
    mapping(address => bool) private _isEmploymentWallet; //Employment Wallets
    mapping(address => bool) private _isTeamWallet; //Team Wallets
    mapping(address => bool) private _isSniper; //Sniper Wallets

    mapping(address => bool) private _isExcludedFromFee; //Does not pay taxes
    mapping(address => bool) private _isLimitExempt; //Wallet exempted from Hold limits
    mapping(address => bool) private _isExcluded; //Does not have reflections
    address[] private _excluded;

    mapping (address => uint256) private transferTimeTo;
    mapping (address => uint256) private transferTimeFrom;

    uint256 private constant MAX = ~uint256(0);
    uint256 private _tTotal = 1* 10**9 * 10**9; //Total Supply = 1,000,000,000
    uint256 private _rTotal = (MAX - (MAX % _tTotal));
    uint256 private _tFeeTotal;

    string private _name = "CRYPTOHEALTH";
    string private _symbol = "CHT";
    uint8 private _decimals = 9;

    struct BuyFee {
        uint16 developmentFee;
        uint16 treasuryFee;
        uint16 taxFee;
    }

    struct SellFee {
        uint16 developmentFee;
        uint16 treasuryFee;
        uint16 taxFee;
    }

    struct TransferFee {
        uint16 developmentFee;
        uint16 treasuryFee;
        uint16 taxFee;

    }

    BuyFee public buyFee;
    SellFee public sellFee;
    TransferFee public transferFee;

    uint16 private _taxFee;
    uint16 private _developmentFee;
    uint16 private _treasuryFee;

    uint8 private _isQualified;

    IUniswapV2Router02 public uniswapV2Router;
    address private uniswapV2Pair;
    address private _burnWallet = 0x000000000000000000000000000000000000dEaD;

    //Multisignature wallets that will hold tokens to pay for Team, Marketing, and fund utilities

    address public Wallet_Development = payable(address(0x7f1a728cd56C3b5A08BcDB553a8d7229Ea6784f8));
    address public Wallet_Treasury = payable(address(0x45d508e3cBfd74ED2bdDC4Fd168389242Da76930));
    address public Wallet_Prize = 0xf75eD4Bf342569cc73c1739Fc0C42416dA8fb041;
    address public Wallet_Employment1 = 0x3A6f95C81ab4290F152C44f1d071A40C1879aEB2;
    address public Wallet_Employment2 = 0x068f73C1FB75C627f41BFbCeee847abfa97F9080;

    uint256 public _maxTxAmount = 15 * 10**6 * 10**9; //1.5%
    uint256 private _maxHold = 3 * 10**7 * 10**9; //3%
    uint256 public _minHoldToClaim = 1 * 10**5 * 10**9; //10,000 minimum hold for claims

    uint256 private _teamSellLimit = 5 * 10**5 * 10**9; //500,000 per sell
    uint256 private _teamSellStart = 	1749556800; //Locked until June 10, 2025 12:00:00 GMT
    uint256 private _presaleEnd = 	1655035200; //Exclude presale address until June 12, 2022 12:00:00 GMT

    uint256 private _employmentHold = 1 * 10**8 * 10**9; //10% limit for Employment Wallet

    //For Donation Recipient Wallets
    uint256 private donationSell = 999 * 10**2 * 10**9; //99,900 sells
    uint256 private donationTransferMax = 25 * 10**4 * 10**9; //250,000 transfers
    uint256 private burnTransferAmt = 1 * 10**3 * 10**9; //Up to 1,000 burn at a time
    uint256 public _maxDonationRecipientHold = 25 * 10**5 * 10**9; //0.25% of supply
    uint256 private _donationLimit1 = 5 * 10**2 * 10**9; //Donate 500 at a time
    uint256 private _donationLimit2 = 25 * 10**2 * 10**9; //Donate 2,500 at a time
    uint256 private _donationLimit3 = 1 * 10**4 * 10**9; //Donate 10,000 at a time
    uint256 private _donationLimit4 = 1 * 10**5 * 10**9; //Donate 100,000 at a time

    uint256 public _sniperSellLimit = 5 * 10*4 * 10**9; //Snipers can only sell 50,000 tokens at a time

    event isEnrolledAsDonationReceiver(address account);
    event isEnrolledAsTeamWallet(address account);
    event isEnrolledAsSniperAccount (address account);
    event addressExcludedFromFee (address account);

    constructor() payable {

        _rOwned[_msgSender()] = _rTotal;

        buyFee.developmentFee = 2; //Marketing and Team Wallet
        buyFee.treasuryFee = 6; //Treasury Wallet
        buyFee.taxFee = 2; //Reflection

        sellFee.developmentFee = 2;
        sellFee.treasuryFee = 8;
        sellFee.taxFee = 2;

        transferFee.developmentFee = 5;
        transferFee.treasuryFee = 25;  //Transfer tax protects Treasury
        transferFee.taxFee = 10;

        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(
            0x10ED43C718714eb63d5aA57B78B54704E256024E // Pancakeswap
         
        );
        // Create a uniswap pair for this new token
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());

        // set the rest of the contract variables
        uniswapV2Router = _uniswapV2Router;

        //exclude owner and this contract from fee
        _isExcludedFromFee[owner()] = true; 
        _isExcludedFromFee[address(this)] = true; //Include previous owner or deployer from fee!
        _isExcludedFromFee[_burnWallet] = true;
        _isExcludedFromFee[Wallet_Treasury] = true;
        _isExcludedFromFee[Wallet_Development] = true;
        _isExcludedFromFee[Wallet_Prize] = true;
        _isExcludedFromFee[Wallet_Employment1] = true;
        _isExcludedFromFee[Wallet_Employment2] = true;

        // Wallet that are excluded from regular holding limits
        _isLimitExempt[owner()] = true;
        _isLimitExempt[address(this)] = true; //Include previous owner or deployer from holding limits!
        _isLimitExempt[Wallet_Treasury] = true;
        _isLimitExempt[_burnWallet] = true;
        _isLimitExempt[uniswapV2Pair] = true;

        // Employment wallet mapped for separate holding limit
        _isEmploymentWallet[Wallet_Employment1] = true;
        _isEmploymentWallet[Wallet_Employment2] = true;

        // Exclude from Rewards
        _isExcluded[_burnWallet] = true;
        _isExcluded[uniswapV2Pair] = true;
        _isExcluded[address(this)] = true; //Include previous owner or deployer from rewards!
        _isExcluded[Wallet_Development] = true;
        _isExcluded[Wallet_Treasury] = true;
        _isExcluded[Wallet_Prize] = true;

        emit Transfer(address(0), _msgSender(), _tTotal);
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;

    }

    function totalSupply() public view override returns (uint256) {
        return _tTotal;
    }

    function balanceOf(address account) public view override returns (uint256) {
        if (_isExcluded[account]) return _tOwned[account];
        return tokenFromReflection(_rOwned[account]);
    }

    function transfer(address recipient, uint256 amount)
        public
        override
        returns (bool)
    {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender)
        public
        view
        override
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount)
        public
        override
        returns (bool)
    {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            _msgSender(),
            _allowances[sender][_msgSender()].sub(
                amount,
                "ERC20: transfer amount exceeds allowance"
            )
        );
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue)
        public
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].add(addedValue)
        );
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].sub(
                subtractedValue,
                "ERC20: decreased allowance below zero"
            )
        );
        return true;
    }

    function isExcludedFromReward(address account) public view returns (bool) {
        return _isExcluded[account];
    }

    function isExcludedFromFees(address account) public view returns (bool) {
        return _isExcludedFromFee[account];
    }

    function isTeamMember(address account) public view returns (bool) {
        return _isTeamWallet[account];
    }

    function isSniperAccount(address account) public view returns (bool) {
        return _isSniper[account];
    }

    function deliver(uint256 tAmount) public {
        address sender = _msgSender();
        require(
            !_isExcluded[sender],
            "Excluded addresses cannot call this function"
        );
        (uint256 rAmount, , , , ) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rTotal = _rTotal.sub(rAmount);
        _tFeeTotal = _tFeeTotal.add(tAmount);
    }

    function reflectionFromToken(uint256 tAmount, bool deductTransferFee)
        public
        view
        returns (uint256)
    {
        require(tAmount <= _tTotal, "Amount must be less than supply");
        if (!deductTransferFee) {
            (uint256 rAmount, , , , ) = _getValues(tAmount);
            return rAmount;
        } else {
            (, uint256 rTransferAmount, , , ) = _getValues(tAmount);
            return rTransferAmount;
        }
    }

    function tokenFromReflection(uint256 rAmount)
        public
        view
        returns (uint256)
    {
        require(
            rAmount <= _rTotal,
            "Amount must be less than total reflections"
        );
        uint256 currentRate = _getRate();
        return rAmount.div(currentRate);
    }

    function excludeFromReward(address account) public onlyOwner {
        require(!_isExcluded[account], "Account is already excluded");
        if (_rOwned[account] > 0) {
            _tOwned[account] = tokenFromReflection(_rOwned[account]);
        }
        _isExcluded[account] = true;
        _excluded.push(account);
    }

    function includeInReward(address account) external onlyOwner {
        require(_isExcluded[account], "Account is already excluded");
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (_excluded[i] == account) {
                _excluded[i] = _excluded[_excluded.length - 1];
                _tOwned[account] = 0;
                _isExcluded[account] = false;
                _excluded.pop();
                break;
            }
        }
    }

    function excludeFromFee(address account) external onlyOwner {
        require (block.timestamp <= _presaleEnd,
            "Owner cannot exclude from fees and limits after predetermined date.");
        _isExcludedFromFee[account] = true;
        _isExcluded[account] = true;
        _isLimitExempt[account] = true;

        emit addressExcludedFromFee (account);
    }

    //Set as Donation Recipients
    function includeForDonation(address account) external onlyOwner {
        _isDonationRecipient[account] = true;

        emit isEnrolledAsDonationReceiver (account);
    }

    //Remove as Donation Recipient
    function excludeForDonation(address account) external onlyOwner {
        _isDonationRecipient[account] = false;
        
    }

    //Set as Team Wallet
    function includeForTeamWallet(address account) external onlyOwner {
        _isTeamWallet[account] = true;
        _isExcludedFromFee[account] = true;
        _isExcluded[account] = true;

        emit isEnrolledAsTeamWallet (account);
    }

    //Set as Sniper Wallet
    function antiSniper(address account) external onlyOwner {
        _isSniper[account] = true;

        emit isEnrolledAsSniperAccount(account);
    }

    //Checks for cooldown period for transfer to donation recipients
    function checkLastTransfer (address account) public view returns (
        uint256 lastTransfer,
        uint256 donate500,
        uint256 donate2500,
        uint256 donate10K,
        uint256 donate100K) {

        lastTransfer = transferTimeFrom[account];
        donate500 = transferTimeFrom[account] + 60 minutes;
        donate2500 = transferTimeFrom[account] + 8 hours;
        donate10K = transferTimeFrom[account] + 36 hours;
        donate100K = transferTimeFrom[account] + 20 days;
    
        return (lastTransfer, donate500, donate2500, donate10K, donate100K);
    }

    //Checks for cooldown period for sells
    function checkLastSell (address account) public view returns (
        uint256 lastSell,
        uint256 nextSell) {

        require (_isDonationRecipient[account] || _isEmploymentWallet[account]);
        lastSell = transferTimeFrom[account];
        nextSell = lastSell + 7 days;
    
        return (lastSell, nextSell);
    }

    function checkClaimEligibility(address account) public view returns (
            uint256 held,
            uint256 lastTransfer,
            uint256 trans,
            uint8 mheld, 
            uint8 tier,
            string memory) {

        held = balanceOf(account);
        lastTransfer = transferTimeFrom[account];
        trans = block.timestamp - lastTransfer;
       
        if (lastTransfer > 0 && held <= _minHoldToClaim - 1){
            return (held, 0, 0, 0, 0, "Hold at least 10,000 to be eligible for multiplier");
        }                      
        else if (trans >= 157784630 && lastTransfer > 0){ //60 months hold
            return (held, lastTransfer, trans, 60, 9, "TBA");
        }
        else if (trans >= 126227704 && lastTransfer > 0){ //48 months hold
            return (held, lastTransfer, trans, 48, 8, "TBA");
        }
        else if (trans >= 94670778 && lastTransfer > 0){ //36 months hold
            return (held, lastTransfer, trans, 36, 7, "8X multiplier");
        }
        else if (trans >= 63113852 && lastTransfer > 0){ //24 months hold
            return (held, lastTransfer, trans, 24, 6, "5X multiplier");
        }
        else if (trans >= 47335389 && lastTransfer > 0){ //18 months hold
            return (held, lastTransfer, trans, 18, 5, "3X multiplier");
        }
        else if (trans >= 31556926 && lastTransfer > 0){ //12 months hold
            return (held, lastTransfer, trans, 12, 4, "2X multiplier");
        }
        else if (trans >= 15778458 && lastTransfer > 0){ //6 months hold
            return (held, lastTransfer, trans, 6, 3, "1X multiplier");
        }
        else if (trans >= 7889229 && lastTransfer > 0){ //3 months hold
            return (held, lastTransfer, trans, 3, 2, "0.5X multiplier");
        }
        else if (trans >= 2629743 && lastTransfer > 0){ //1 month hold
            return (held, lastTransfer, trans, 1, 1, "0.25X multiplier");
        }
        else if (trans >= 1209600 && lastTransfer > 0){ //2 weeks
            return (held, lastTransfer, trans, 0, 0, "Holding for at least 2 weeks!");
        }
        else if (trans == block.timestamp){
            return (held, 0, 0, 0, 0, "No transfer history!");
            }
        else {
            return (held, lastTransfer, 0, 0, 0, "Less than 2 weeks since last transfer!");
        }

    }

    // Change donation sell limits for partners
    function setDonationSell(uint256 dsell) external onlyOwner {
        require(dsell == 999 * 10**2 * 10**9 || dsell == 999 * 10**1 * 10**9,
                "Can only set to either 99,900 or 9,990"
                );

        donationSell = dsell;

    }
    // Maximum buy fee canot not be set over 10%
    function setBuyFee(uint16 develop, uint16 treasury, uint16 tax) external onlyOwner {
        require(develop + treasury + tax <= 10, "Fees are capped at 10%"); 
        
        buyFee.developmentFee = develop;
        buyFee.treasuryFee = treasury;
        buyFee.taxFee = tax;
    }

    // Maximum sell fee canot not be set over 15%
    function setSellFee(uint16 develop, uint16 treasury, uint16 tax) external onlyOwner {
        require(develop + treasury + tax <= 15, "Fees are capped at 15%"); 

        sellFee.developmentFee = develop;
        sellFee.treasuryFee = treasury;
        sellFee.taxFee = tax;
    }

    // Maximum transfer fee canot not be set over 40%
    // Transfers are highly discouraged!
    function setTransferFee(uint16 develop, uint16 treasury, uint16 tax) external onlyOwner {
        require(develop + treasury + tax <= 40, "Fees are capped at 40%"); 

        transferFee.developmentFee = develop;
        transferFee.treasuryFee = treasury;
        transferFee.taxFee = tax;
    }

    function _reflectFee(uint256 rFee, uint256 tFee) private {
        _rTotal = _rTotal.sub(rFee);
        _tFeeTotal = _tFeeTotal.add(tFee);
    }

    function _getValues(uint256 tAmount)
        private
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        (
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tTreasury,
            uint256 tDevelopment
        ) = _getTValues(tAmount);
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(
            tAmount,
            tFee,
            tTreasury,
            tDevelopment,
            _getRate()
        );
        return (
            rAmount,
            rTransferAmount,
            rFee,
            tTransferAmount,
            tFee
        );
    }

    function _getTValues(uint256 tAmount)
        private
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        uint256 tFee = calculateTaxFee(tAmount);
        uint256 tTreasury = calculateTreasuryFee(tAmount);
        uint256 tDevelopment = calculateDevelopmentFee(tAmount);
        uint256 tTransferAmount = tAmount.sub(tFee);
        tTransferAmount = tTransferAmount.sub(tTreasury).sub(tDevelopment);
        return (tTransferAmount, tFee, tTreasury, tDevelopment);
    }

    function _getRValues(
        uint256 tAmount,
        uint256 tFee,
        uint256 tTreasury,
        uint256 tDevelopment,
        uint256 currentRate
    )
        private
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 rAmount = tAmount.mul(currentRate);
        uint256 rFee = tFee.mul(currentRate);
        uint256 rTreasury = tTreasury.mul(currentRate);
        uint256 rDevelopment = tDevelopment.mul(currentRate);
        uint256 rTransferAmount = rAmount
            .sub(rFee)
            .sub(rTreasury)
            .sub(rDevelopment);
        return (rAmount, rTransferAmount, rFee);
    }

    function _getRate() private view returns (uint256) {
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
        return rSupply.div(tSupply);
    }

    function _getCurrentSupply() private view returns (uint256, uint256) {
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (
                _rOwned[_excluded[i]] > rSupply ||
                _tOwned[_excluded[i]] > tSupply
            ) return (_rTotal, _tTotal);
            rSupply = rSupply.sub(_rOwned[_excluded[i]]);
            tSupply = tSupply.sub(_tOwned[_excluded[i]]);
        }
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);
        return (rSupply, tSupply);
    }

    function _takeTreasuryAndDevelopment(uint256 tTreasury, uint256 tDevelopment)
        private
    {
        uint256 currentRate = _getRate();
        uint256 rTreasury = tTreasury.mul(currentRate);
        uint256 rDevelopment = tDevelopment.mul(currentRate);

        _rOwned[Wallet_Treasury] = _rOwned[Wallet_Treasury].add(rTreasury);
        _rOwned[Wallet_Development] = _rOwned[Wallet_Development].add(rDevelopment);

        _tOwned[Wallet_Treasury] = _tOwned[Wallet_Treasury].add(tTreasury);
        _tOwned[Wallet_Development] = _tOwned[Wallet_Development].add(tDevelopment);

    }

    function calculateTaxFee(uint256 _amount) private view returns (uint256) {
        return _amount.mul(_taxFee).div(10**2);
    }

    function calculateTreasuryFee(uint256 _amount)
        private
        view
        returns (uint256)
    {
        return _amount.mul(_treasuryFee).div(10**2);
    }

    function calculateDevelopmentFee(uint256 _amount)
        private
        view
        returns (uint256)
    {
        return _amount.mul(_developmentFee).div(10**2);
    }

    function removeAllFee() private {
        _taxFee = 0;
        _treasuryFee = 0;
        _developmentFee = 0;
    }

    function setBuy() private {
        _taxFee = buyFee.taxFee;
        _treasuryFee = buyFee.treasuryFee;
        _developmentFee = buyFee.developmentFee;
    }

    function setSell() private {
        _taxFee = sellFee.taxFee;
        _treasuryFee = sellFee.treasuryFee;
        _developmentFee = sellFee.developmentFee;
    }

    function setTransfer() private {
        _taxFee = transferFee.taxFee;
        _treasuryFee = transferFee.treasuryFee;
        _developmentFee = transferFee.developmentFee;
    }

    function claimStuckTokens(address _token) external onlyOwner {
        require(_token != address(this), "No rug pulls :)");

        if (_token == address(0x0)) {
            payable(owner()).transfer(address(this).balance);
            return;
        }

        IERC20 erc20token = IERC20(_token);
        uint256 balance = erc20token.balanceOf(address(this));
        erc20token.transfer(owner(), balance);
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) private {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount

    ) private {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");

        //Owner Wallet receiving limits
        if (to == owner()){
            require  (from == _burnWallet, "Owner wallet cannot receive tokens.");
        }

        // Please do not bot unless you want to get burned
        if (_isSniper[from])
            {
            if (block.timestamp <= 1844251200) { // Will be allowed transfer until June 10, 2028 12:00:00 GMT
            require ((to == uniswapV2Pair
                    && amount <= _sniperSellLimit) // Can sell 50,000 tokens at a time
                    || ((to == Wallet_Treasury || to == Wallet_Development)
                    && amount <= donationTransferMax) // Transfer 250,000 buy back at half price
                    || ((to != Wallet_Treasury || to != Wallet_Development
                        || to != owner() || !_isDonationRecipient[to])
                    && amount <= _maxTxAmount) // Transfer to another wallet, pay transfer tax
                    && (block.timestamp >= transferTimeFrom[from] + 14 days), // Can only transfer twice a month
                    "Account tagged as Sniper, with limited capacity to send."
            );
            transferTimeFrom[from] = block.timestamp;

            }
                else { // Snipers can only have tokens burned
                require (to == _burnWallet && amount <= _maxTxAmount,
                        "No option but to burn, buyback for 1/5th of current price."); // Treasury will manually buy back
            }
            
        }

        // Team Wallet sending limits, buyer protection for misuse of lack of fees. Limits as follows:
        if (_isTeamWallet[from])
            {
            require (_isExcluded[to] // Can only sell or burn, cannot transfer to others
                    && amount <= _teamSellLimit // Can only sell 500K tokens at a time
                    && block.timestamp >= _teamSellStart // Can only sell after predetermined period
                    && block.timestamp >= transferTimeFrom[from] + 14 days, // Can only sell twice a month
                    "Team Wallet can only transfer 500,000 tokens every 14 days after timelock."
            );
            transferTimeFrom[from] = block.timestamp;
        }

        // Prize Wallet Limits
        if (to == Wallet_Prize)
            {
            uint256 heldTokens = balanceOf(to);
            require ((from != owner() && from == Wallet_Treasury) // Can only receive tokens from Treasury."
                    && (heldTokens + amount) <= _maxHold,
                    "Prize Wallet can only receive from Treasury Wallet."
             );        
        }

        // Prize Wallet Limits
        if (to == Wallet_Prize)
            {
            uint256 heldTokens = balanceOf(to);
            require ((from != owner() && from != uniswapV2Pair && from == Wallet_Treasury) // Can only receive tokens from Treasury."
                    && (heldTokens + amount) <= _maxHold,
                    "Prize Wallet can only receive from Treasury Wallet."
             );        
        }

        // Prize Wallet Limits
        if (from == Wallet_Prize) 
            {
            require (to != owner() && to != Wallet_Treasury && to != Wallet_Development
                     && !_isDonationRecipient[to] && to != uniswapV2Pair && !_isEmploymentWallet[to],
                    "Prize Wallet can only transfer to Regular Holders."
            );

        }
        
        // Employment Wallet Limits
        if (_isEmploymentWallet[to])
            {
            uint256 heldTokens = balanceOf(to);
            require ((from !=owner() && _isDonationRecipient[from] && from == Wallet_Treasury) // Can only receive tokens from Treasury and Donation Recipients."
                    && (heldTokens + amount) <= _employmentHold, // Can only hold at most 10% of the supply"
                    "Employment Wallet can only receive from certain wallets."
             );        
        }

        // Employment Wallet Limits
        if (_isEmploymentWallet[from]) 
            {
            require (to == Wallet_Treasury || to == uniswapV2Pair // Can only sell or transfer to Treasury
                    && amount <= _teamSellLimit // Can only transfer at most 500K tokens at a time
                    && block.timestamp > transferTimeFrom[from] + 7 days, // Can only sell once every 7 days
                    "Employment Wallet has transfer limitations."
            );
            transferTimeFrom[from] = block.timestamp;
        }

        // Donation Wallet receiving limits

        if (_isDonationRecipient[to])
            {
            uint256 heldTokens = balanceOf(to);
            require (from != owner() && ((heldTokens + amount) <= _maxDonationRecipientHold) 
                    && 
                    ((amount == _donationLimit1 // Can only donate 500 tokens at a time
                    && block.timestamp > transferTimeFrom[from] + 60 minutes) // 1-hour donation cooldown
                    ||
                    (amount == _donationLimit2 // Can only donate 2500 tokens at a time
                    && block.timestamp > transferTimeFrom[from] + 8 hours) // 8-hour donation cooldown
                    ||
                    (amount == _donationLimit3 // Can only donate 10000 tokens at a time
                    && block.timestamp > transferTimeFrom[from] + 36 hours) // 36-hour donation cooldown
                    ||
                    (amount == _donationLimit4 // Can only donate 100K tokens at a time
                    && block.timestamp > transferTimeFrom[from] + 20 days)), // 20-day donation cooldown
                    "Donation cooldown times as follows: Donate 100K (20d), 10K (36h), 2500 (8h), 500 (1h)."
            );
            transferTimeFrom[from] = block.timestamp;
            
        }

        // Donation Wallet transfer and sell limits, buyer protection for misuse of lack of fees
        if (_isDonationRecipient[from]) 
            {
            require ((amount == donationTransferMax && _isEmploymentWallet[to]) // Send 250,000 tokens to Employment Wallet
                    || ((amount == donationSell && to == uniswapV2Pair)
                       && (block.timestamp > transferTimeFrom[from] + 3 days)) // Sell 99,900 tokens every 3 days
                    || (amount <= burnTransferAmt && to == _burnWallet), // Burn at most 1,000 tokens at a time
                    "Donation Recipient Wallets have transfer limitations."
            );
            transferTimeFrom[from] = block.timestamp;

        }

        // Regular Wallet Limit
        if (!_isLimitExempt[to] && !_isEmploymentWallet[to] && !_isDonationRecipient[to] && from != owner())
            {
            uint256 heldTokens = balanceOf(to);
            require((heldTokens + amount) <= _maxHold, 
                "Wallet cannot exceed maximum hold limit."
            );
        }

        if (from != owner() && to != owner()) {
            require(
                amount <= _maxTxAmount,
                "Transfer amount exceeds the maximum transaction amount."
            );
            transferTimeFrom[from] = block.timestamp;
}

        //indicates if fee should be deducted from transfer
        bool takeFee = true;

        //if any account belongs to _isExcludedFromFee account then remove the fee
        if (_isExcludedFromFee[from] || _isExcludedFromFee[to] 
            || _isDonationRecipient[from] || _isDonationRecipient[to] 
            || _isEmploymentWallet[from] || _isEmploymentWallet[to]
            || from == Wallet_Treasury) {
            takeFee = false;
        }

        //transfer amount, it will take tax, treasury, prize fee
        _tokenTransfer(from, to, amount, takeFee);
    }

    //this method is responsible for taking all fee, if takeFee is true
    function _tokenTransfer(
        address sender,
        address recipient,
        uint256 amount,
        bool takeFee
    ) private {
        if(!takeFee)
        removeAllFee();

        if (takeFee) {
            if (sender == uniswapV2Pair) {
                setBuy();
            }
                else if (recipient == uniswapV2Pair) {
                setSell();

            }  
                else {
                setTransfer();
            } 

        }
         
        if (_isExcluded[sender] && !_isExcluded[recipient]) {
            _transferFromExcluded(sender, recipient, amount);
        } else if (!_isExcluded[sender] && _isExcluded[recipient]) {
            _transferToExcluded(sender, recipient, amount);
        } else if (!_isExcluded[sender] && !_isExcluded[recipient]) {
            _transferStandard(sender, recipient, amount);
        } else if (_isExcluded[sender] && _isExcluded[recipient]) {
            _transferBothExcluded(sender, recipient, amount);
        } else {
            _transferStandard(sender, recipient, amount);
        }
    }

    function _transferStandard(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee

        ) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeTreasuryAndDevelopment(
            calculateTreasuryFee(tAmount),
            calculateDevelopmentFee(tAmount)

        );
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferToExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee

        ) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeTreasuryAndDevelopment(
            calculateTreasuryFee(tAmount),
            calculateDevelopmentFee(tAmount)

        );
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferFromExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee

        ) = _getValues(tAmount);
        _tOwned[sender] = _tOwned[sender].sub(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeTreasuryAndDevelopment(
            calculateTreasuryFee(tAmount),
            calculateDevelopmentFee(tAmount)

        );
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferBothExcluded(
        address sender,
        address recipient,
        uint256 tAmount

    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee

        ) = _getValues(tAmount);
        _tOwned[sender] = _tOwned[sender].sub(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeTreasuryAndDevelopment(
            calculateTreasuryFee(tAmount),
            calculateDevelopmentFee(tAmount)

        );
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }
    
    //to recieve ETH from uniswapV2Router when swaping
    receive() external payable {}

}

// Token developed by DR_MIST | tokens_by_me (Fiverr)
// Stay SAFU, say no to rugs, and always DYOR
