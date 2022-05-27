# cryptohealth
**BSC Project focusing on financial reimbursements and cryptocurrency donations**

This is my 2nd upload on the BSC Mainnet, as my first contract had problems with the Exclude fees.

I initially forked this from a BNB reflection and auto-liquidity contract with marketing wallet, however,
I eventually removed the autoliquidity features and BNB reflections for a variety of reasons:

1. I would not want to see the big sells we see in SFM-fork contracts, I'd rather manually sell
2. As per advise from a developer, the token itself will grow in price more than that of BNB,
   hence, will be a better investment in the long run
3. I plan on generating new liquidity, but in BUSD, to keep the price less dependent on BNB value
4. I was afraid of the token becoming too big because of the transfer conditions, and other functions I added

The following contract is quite unorthodox, since I opted to remove functions I think will be unsafe,
and added a variety of if conditions for the transfer (since the project will need a variety of wallets)

Tokenomics are as follows:
100,000,000 - Team tokens (10%)
600,000,000 - Presale tokens (60%)
100,000,000 - Cross chain / Blockchain / Development Tokens (10%)
150,000,000 - CEX Listings (15%)
  5,000,000 - Team Expansion (5%)
  
Taxes are as follows:
10% - Buy (cannot increase more than 10%)
12% - Sell (cannot increase more than 15%)
40% - Transfer (cannot increase more than 40%)

Transfer taxes were increased to discourage holders from transferring to other holders (except for Donation Recipients)

Taxes go to Reflections, Development (Team and Marketing), and Charity Wallet (i.e. Treasury)

Other contract features that were made in an effort to make a safe contract are as follows:

> Maximum wallet of 3% (30,000,000 tokens)
> Maximum transaction limit of 1.5% (15,000,000 tokens)
> Exclude from fees, transaction limits, and holding limits - limited by block.timestamp, only until 2 days after Presale
> No minting function
> No option to turn off trades
> No option to change router
> Team tokens locked by block.timestamp and has transfer limits
> Owner wallet cannot receive tokens
> Team wallets cannot receive or buy tokens (since they are excluded from fees and rewards)
> Donation recipients can only sell at a limited amount and cannot buy (since they are excluded from fees)
> Anti-bot/sniper function (to deter bot users from buying, severely limited selling)

Should you have questions, feel free to shoot me an email at admin@cryptohealth.life.
