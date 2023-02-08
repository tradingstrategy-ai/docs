
.. _glossary:

Glossary
========

Here you can find terminology used in the documentation, decentralised finance
and algorithmic trading.

.. glossary::
    :sorted:

    AMM
        Automated market maker (AMM) is a `bonding curve based <https://docs.ethhub.io/guides/graphical-guide-for-understanding-uniswap/>`__ decentralised exchange. It does not
        have an order book.

    On-chain

        On-chain refers to any activity that happens purely on a public blockchain. It means the data
        and trading venues are publicly and fairly available for anyone.

    Backtest

        Simulating the efficiency of a trading strategy against historical data.

    Decentralised exchange

        Decentralised exchange (DEX) is an asset trading exchange where all trades happen purely :term:`on-chain`. These exchanges are public, fair, cheap and especially censorship proof. There is no middleman like a broker when you are trading on these venues, but you get equal access to the trade flow. Decentralised exchanges can be :term:`AMM` based or order book based. Some of the most popular decentralised exchanges are Uniswap, Sushiwap and PancakeSwap.

        See also :term:`CEX`.

    Autonomous agent

        An agent software that acts without human intervention. Once started, there is no further need for system administration or othe work.

    Smart contract

        An automated transactional service running on any of the blockchains supporting smart contracts. Typically
        runs on Ethereum-based blockchain and is written in the Solidity programming language.

    Jupyter notebook

        A popular Python based data science tool. Jupyter allows users to run data research :term:`notebooks <notebook>` interactively. Jupyter notebooks can be easily shared, run on your local computer or on a hosted cloud environment, both free and paid. `More information <https://jupyter.org/>`__.

    Pandas

        A popular Python-based data analysis library.  `More information <https://pandas.pydata.org/>`__.

    Uniswap

        The most popular :term:`AMM` based :term:`decentralised exchange`. Uniswap has two major versios.
        In version 2 (v2) the liquidity is evenly distributed across the bonding curve. In version 3, the
        liquidity providers can have liquidity on a partial curve, simulate order book and have better
        capital efficiency. Most decentralised exchanges are Uniswap v2 :term:`clones <clone>`.

    Clone

        Also known as fork. A product launched based on the open source code of another existing product.
        In the context of :term:`on-chain`, usually hostile to the original product and competes from the
        same :term:`liquidity`.

    Candle

        Candle, or a candlestick is a type of price chart used in technical analysis that displays the high, low, open, and closing prices of an asset for a specific time period, or :term:`bucket`. `More information <https://en.wikipedia.org/wiki/Candlestick_chart>`__.

    Bucket

        The (time) bucket to a time period for :term:`candle` data. For example, you can have one minute, one hour or time buckets, describing for the what period of a time the candle includes the trades.

        Also known as time frame, candle length or candle duration.

    OHLCV

        A typical :term:`candle` contains open, high, low and close price and trade volume for a :term:`time bucket <bucket>`. Because on-chain exposes more data than centralised exchanges, Trading Strategy data also contains individual buys and sells, US dollar exchange rate and so forth.

    Parquet

        A popular file format for large datasets from Apache Arrow project. `More information <https://parquet.apache.org/>`__.

    Pyarrow

        Python API for :term:`Arrow` library. `More information <https://arrow.apache.org/docs/python/>`__.

    Arrow

        Apache Arrow is a popular open source in-memory analytics technology kit. `More information <https://arrow.apache.org/docs/index.html>`__.

    Dataclass

        Standard Python way to annotate data structures. `More information <https://realpython.com/python-data-classes/>`__.

    Dataset

        A data bundle consisting of :term:`candles <candle>` or other quantitative data sources.
        The most usual dataset is hourly or daily candles for multiple assets, distributed as a downloadable archive of several hundreds of megabytes.

    Dataset server

        The server than indexes blockchains and creates :term:`candle` and other :term:`datasets <dataset>` for research, analysis and trade execution. Currently centralised and you need an API key to access.

    Notebook

        Notebook refers to an interactively editable Python script or application, mixed with diagrams and notes. The format was popularised by :term:`Jupyter notebook`.

    Strategy

        Also known as trading strategy or algorithm. A trading strategy is a rulebook of what trades to make an how. In the context of quantative finance, and especially automated trading, this rulebook can be expressed as an algorithm and trading bot that has programmed rules for every situation the strategy may encounter.

    Technical analysis

        Technical analysis is a trading discipline employed to evaluate investments and identify trading opportunities by analyzing statistical trends gathered from trading activity, such as price movement and volume. `More information <https://www.investopedia.com/terms/t/technicalanalysis.asp>`__.

    Backtrader

        An old Python based algorithmic trading framework for strategy backtesting and live execution.
        No longer maintained.
        `See documentation <https://www.backtrader.com/>`__.

    QSTrader

        An old Python based algorithmic trading framework for strategy backtesting and live execution
        using portfolio construction theory.
        No longer maintained.

    Fastquant

        Fastquant allows you to easily backtest investment strategies with as few as three lines of Python code. Its goal is to promote data driven investments by making quantitative analysis in finance accessible to everyone. Fastquant builds on the top of :term:`Backtrader`. See `Github repository <https://github.com/enzoampil/fastquant>`__.

    Base token

        The token you want to buy or sell in a trading pair. See also :term:`quote token`.

    Quote token

        The token that acts as a nominator for the price when you are buying or selling. Usually this is more well-known token of the pair: ETH, BTC or any of various USD stablecoins. See also :term:`base token`.

    Liquidity

        Liquidity refers to the depth of the order books: how much volume a single trade can achieve without moving the price. It can be expressed as :term:`slippage` or absolute depth of the order book. The latter is very easy for :term:`AMM` based exchanges where the liquidity is a continuous function. Trading Strategy provides :term:`datasets <dataset>` for AMM liquidity in :py:mod:`capitalgram.liquidity` module.

    Yield farming

        Pooling assets of multiple people for passive trading strategies. Usually yield farming pools rely on liquidity mining token distribution which they immediately sell (auto compounding). Yield farms operate solely on smart contracts and their strategies are limited. Yield farms almost always take zero market risk agains their :term:`quote token`.

    Exposure

        The risk of a strategy for the volatility of a particular asset. For example, if you have 100% exposure to ETH and ETH prices drops to zero, you lose all of your money.

    Market neutral strategy

        Market neutral strategies are trading strategies that have little or no :term:`exposure` to crypto asset volatility. They are often :term:`high-frequency trading` strategies, like arbitrage. Good market neutral strategies can make 10% - 20% monthly yield in cryptocurrency markets.

    High-frequency trading

        High-frequency trading, or HFT for short, is a trading strategy where you do arbitration, cross-market market making or such and compete against the other actors with your technical speed. Trading Strategy is not a suitable framework for HFT trading, though its data can aid to come up with good HFT strategies.

    Directional strategy

        A trading strategy where you bet the market to go up or down.

    Active strategy

        Buying and selling assets based on the market movement. Differs from buy-and-hold by actively (hourly, daily, weekly) engaging in trading. `Read more <https://www.investopedia.com/articles/active-trading/11/four-types-of-active-traders.asp>`__.

    Non-custodial

        A smart contract based service model where the owner of the assets never lose the control of the assets. This is opposite to most traditional finance services where you cannot see what happens to your money after the deposit or whether you are able to withdraw. The integrity of the service provider in the traditional finance thus needs to be guaranteted through regulation or government bailouts. The non-custodial model is specific to smart contracts and cannot be achieved without a blockchain. `Read more <https://stackoverflow.com/questions/65009246/what-does-non-custodial-mean>`__.

    Private strategy

        A trading strategy where the source code of the strategy is not disclosed to public. Private strategies can still be :term:`non-custodial` and enjoy the benefits of Trading Strategy protocol trade execution and fee distribution.

    Risk-free rate

        The expected return for the money that is considered (almost) risk-free. On the traditional markets, this is the tresury note or government bond yield (although you still have some risks like the sovereignity risk). In DeFi this is considered an US dollar lending pool rate, like one you would get from Aave :term:`USDC` pool.

    Drawdown

        How much in percent terms the asset goes or can go down.

        Drawdown refers to the peak-to-trough decline in the value of an investment, usually measured as the percentage of an investment's peak value. It is a measure of the risk of an investment, as it indicates the amount that an investment can decline before it reaches a new high. Drawdown can also refer to the period of time during which an investment's value is in decline.

        `Read more <https://en.wikipedia.org/wiki/Drawdown_(economics)>`__.

    Maximum drawdown

        The maximum :term:`drawdown` is how much your portfolio goes down in the examination period,
        or maximum amount of loss if you had entered and exited at the worst possible moment.

        Maximum drawdown (MDD) is the largest peak-to-trough decline in the value of an investment over a specific period of time. It is a measure of the risk of an investment, as it indicates the largest amount that an investment can decline from its highest point to its lowest point during a specific period of time. MDD is typically used to measure the risk of a portfolio or investment strategy, and is often expressed as a percentage of the investment's peak value.

        As a rule of thumb, the maximum drawdown should not be more than 1/3 of the strategy annual returns.

    USDC

        A popular US cash and US treasury note backed stablecoin from Circle. `Read more <https://www.circle.com/en/usdc>`__.

    Pine Script

        A proprietary trading strategy programming language for :term:`TradingView`. `Read more <https://www.tradingview.com/support/solutions/43000561836-what-is-pine-script/>`__.

    TradingView

        Trading view is the world most popular trading strategy platform. It lets you discover investment ideas and showcase your talents to a large and active community of traders. Easy and intuitive for beginners, and powerful enough for advanced chartists. Trading View has all the charting tools you need to share and view trading ideas. Real-time data and browser-based charts let you do your research from anywhere, since there are no installations or complex setups. `Read more <https://www.quora.com/What-is-TradingView>`__.

    EVM compatible

        EVM refers to Ethereum Virtual Machine. EVM compatible blockchain is a blockchain that runs Ethereum Virtual Machine that can run smart contracts written for Ethereum.
        Having EVM compatibility makes it efficient to bring existing Ethereum projects to alternative L1 and L2 blockchains.
        EVM compatible blockchains started to get popular in 2020.
        A well-known EVM compatible blockchains include Polygon, Avalanche, Binance Smart Chain, Harmony, Telos EVM and Fantom.
        Smart contract programmers do not need to modify their existing Solidity or Vyper code and they can re-deploy contracts
        on any EVM chain.

    Bonding curve

        In a bonding curve based exchange, like an :term:`AMM`, market makers do not set limit
        orders to provide liquidity. Instead, the liquidity follows a predefined mathematical function. Every time
        there is a buy or a sell, the price moves up or down defined by this function.

        `Read more about xy=k curve slippage, price impact on Paradigm's post <https://research.paradigm.xyz/amm-price-impact>`_.

        See also: :term:`XY liquidity model`.

    XY liquidity model

        XY liquidity model, as known as XYK, is a :term:`bonding curve` model where the price of an asset follows the equation:

        :math:`x*y=k_{market\_maker}`

        This model was popularised by :term:`Uniswap` version 2 :term:`decentralised exchange`.
        Anyone can buy or sell coins by essentially shifting the market maker's, also known as a liquidity provider, position on the ``x*y=k`` curve.

        On Trading Strategy, the available liquidity is usually expressed as the US dollar amount of one side of the pair. For example adding 100 BNB + 5000 USD to the liquidity
        is presented as 5000 USD available liquidity.

        See also :term:`price impact` and :term:`slippage`.

        `Read more about slippage and price impact on Paradigm's post <https://research.paradigm.xyz/amm-price-impact>`_.

        `Read more about XY liquidity model <https://medium.com/phoenix-finance/understanding-the-xyk-model-of-pooled-liquidity-7340fdc20d9c>`_.

    Price impact

        Price impact is the difference between the current market price and the price you will actually pay when performing a swap on a decentralized exchange.

        Price impact tells how much less your market taker order gets filled because there is not available liquidity.
        For example, if you are trying to buy 5000 USD worth of BNB token, but there isn't available liquidity
        you end up with 4980 USD worth of token at the end of the trade when you pay 5000 USD.
        The missing fill is the price impact.
        It can be expressed as USD value or as percent of the trade amount.

        Illiquid pairs have more price impact than liquid pairs.

        Liquidity provider fees are included in the price impact in AMM models.

        Another way to see this: AMMs usually have a trading fee, of 0.30%, for liquidity providers and sometimes for the protocol.
        This translates to a spread of 0.6% between the best buy order and the best sell order.
        In other words, even the most liquid AMM trade has an implicit 0.3% price impact. Note that due to competition, the LP fees
        are going down on newer AMMs.

        `Read a detailed analysis of how price impact is calculated on Uniswap v2 style AMMs <https://ethereum.stackexchange.com/a/111334/620>`_.

        `See ParaSwap documentation on price impact <https://doc.paraswap.network/price-impact-slippage>`_.

        See also :term:`XY liquidity model`.

        See also :term:`Slippage`.

    Slippage

        Slippage is the loss because markets changed after the trade was initiated but before it was executed.

        Slippage occurs because of changing market conditions between the moment the transaction is submitted and its verification.
        Slippage cannot be backtested easily, because it is based on the trade execution delays and those cannot be usually simulated
        (but can be measured).

        :term:`DEX <decentralised exchange>` swap orders have a slippage parameter with them. You set it when the order is created.
        If the price changes more then the slippage between the creation of the order and the execution of the order,
        the DEX will cancel the order (revert).

        Setting a low slippage value prevents frontrunning your trades, because frontrunners cannot
        extract more value than what your slippage tolerance is.

        `See ParaSwap's excellent documentation on slippage <https://doc.paraswap.network/price-impact-slippage>`_.

        See also :term:`Price impact`.

    Oracle

        Blockchain oracles are entities that connect blockchains to external systems, thereby
        enabling smart contracts to execute based upon inputs and outputs from the real world.
        `Read More <https://chain.link/education/blockchain-oracles>`_

        Trading Strategy :ref:`protocol` has its own :ref:`oracles <oracle>`.

    Mid Price

        The mid price, in the context of AMM, is the price that reflects the ratio of reserves in one or more pairs. There are three ways we can think about this price. Perhaps most simply, it defines the relative value of one token in terms of the other. It also represents the price at which you could theoretically trade an infinitesimal amount (ε) of one token for the other. Finally, it can be interpreted as the current market-clearing or fair value price of the assets.

        The mid price, in the context of order book based exchange is :math:`(best bid + best ask) / 2`,
        i.e. the price between the best sell offer and the best buy offer.

        `More information about the mid price on Uniswap documentation <https://docs.uniswap.org/sdk/2.0.0/guides/pricing>`_.

    Rug pull

        A project where the development team or founders decide to maliciously cash out early, not
        fulfilling their promises and disappear with the investor money.

        `One of the most famous rug pulls is Anubis ($60M taken) <https://decrypt.co/84924/anubisdao-investors-lose-60-million-in-alleged-rug-pull>`_.

    Strategy cycle

        Strategies are executed in incremental, fixed internal cycles.
        See :term:`cycle duration`.

    Cycle duration

        Cycle duration defines how often the strategy main loop triggers.
        This can be different from the candle :term:`bucket` the strategy is using.
        For example, a strategy can have a cycle duration of 16h and makes
        trades based on 4h candles.

    Enzyme

        Enzyme is a fund backoffice protocol for :term:`EVM compatible`
        blockchains.

        See `Enzyme Finance <https://enzyme.finance/>`__ for more information.

    Docker

        Linux process and packaging management framework. Ideal for managing
        long-running server-side processes.

        `See Docker.com for more information <https://www.docker.com/>`__.

    Vault

        In decentralised finance, a vault refers to a smart contract
        that manages assets, in non-custodial manner, for several stakeholders.
        Usually when you deposit to a vault you receive share or liquidity provider
        tokens as a return.

        `See EIP-4626 Tokenised vault standard <https://eips.ethereum.org/EIPS/eip-4626>`__
        for more information.

    Technical indicator

        A technical indicator, or just an indicator, is a calculated value
        indicating something about the state of the market.
        Indicators are usually based on :term:`OHLCV` data.
        By combining several indicators through :term:`technical analysis`,
        one can create automated trading strategies.
        An example technical indicator is :term:`EMA (expotential moving average) <EMA>`.

        See :ref:`technical analysis` documentation for Trading Strategy indicator list.

    EMA

        Exponential moving average. One of the most common :term:`technical indicators <technical indicator>`.
        By comparing the current price of an asset to the moving average price,
        one can determine if the current price is likely dislodged above or
        below the market trend.

        `See this post for more information on simple and exponential moving average <https://school.stockcharts.com/doku.php?id=technical_indicators:moving_averages>`__.

    DeFi

        Decentralised finance, or DeFi, for short, refers to :term:`on-chain`,
        protocol based, trading activities. DeFi protocols include
        exchanges, like :term:`Uniswap` and lending pools like Aave.
        DeFi services are :term:`non-custodial`, being the largest
        difference to centralised finance (CeFi) services.

        `Read more <https://en.wikipedia.org/wiki/Decentralized_finance>`__.

    Quantitative finance

        Quantitative analysis is the use of mathematical and statistical methods in finance and investment management. Those working in the field are quantitative analysts (quants). Quants tend to specialize in specific areas which may include derivative structuring or pricing, risk management, algorithmic trading and investment management.

        `Read more <https://en.wikipedia.org/wiki/Quantitative_analysis_(finance)>`__.

    Stablecoin

        Stablecoins are cryptocurrencies of which value follows a fiat currency value, like the US dollar.
        One of the most popular stablecoins is :term:`USDC`.

    Python

        One of the most popular and loved programming languages.
        Python is the number one programming language in :term:`quantitative finance`.

        `Read more <https://python.org>`__.

    Market data feed

        A time-series data on which automated trade decisions are based on.
        One of the most common data feeds is the price data as :term:`OHLCV` :term:`candles <candle>`.

    Deterministic

        In mathematics, computer science and physics, a deterministic system is a system in which no randomness is involved in the development of future states of the system. A deterministic model will thus always produce the same output from a given starting condition or initial state.

        `Read more <https://en.wikipedia.org/wiki/Deterministic_system>`__.

    Position

        In trading slang, a position means open long or short position of a particular
        asset betting the price of an asset goes up or down. In long positions,
        the trader expects the asset price go up, or appreciate. In short positions,
        the trade expects the asset price go down.

    Trading universe

        A trading universe describes all possible assets availble for a :term:`strategy`
        for its to take different :term:`trading positions <position>`. The simple
        trading strategies trade only a single trading pair like ETH/USD. More complex
        strategies can have trding universe consisting of thousands of trading pairs
        and assets.

    Factor investing

        Factor investing is an investment approach that chooses securities based on attributes that have historically been associated with higher returns. There are two main types of factors: macroeconomic and style. The investing in factors can help improve portfolio outcomes, reduce volatility and enhance diversification.

        `Read more <https://learn.aikido.finance/blog/post/how-to-choose-an-algorithmic-trading-strategy-stocks/>`__.

    Alpha generation platform

        An alpha generation platform is a technology used in algorithmic trading to develop quantitative financial models, or trading strategies, that generate consistent alpha, or absolute returns. The process of alpha generation refers to generating excess returns. Alpha generation platforms are tools used by hedge funds, banks, CTAs and other financial institutions to help develop and test quantitative trading strategies. Alpha generation platforms support quants in the creation of efficient and productive quantitative trading strategies.

        `Read more <https://en.wikipedia.org/wiki/Alpha_generation_platform>`__.

    Native token

        Also known as "gas token". The native token is the cryptocurrency used to pay
        transction fees on :ref:`EVM compatible` blockchain. For Ethereum it is ETH,
        for Polygon it is MATIC and for Binance Smart Chain it is BNB.

    TWAP

        TWAP or Time-weighted Average Price is a calculation that defines the weighted average price over a specified period.

        The real-time price of decentralised exchanges is subject to quite easy manipulation, especially within the
        range of one block. A manipualtor can use flashloans to access large amount of capital and make trades
        that a normal trader would not do.

        These kind of attacks may cause very high/low price candles. Using the TWAP price mitigates
        the risk of performing e.g. an unnecessary stop-loss trigger on a manipulated price.

        `On the security and compromises of price oracles <https://ethereum.stackexchange.com/a/114990/620>`__.

        `Read Uniswap v3 TWAP oracle manipulation cost <https://github.com/euler-xyz/uni-v3-twap-manipulation/blob/master/cost-of-attack.pdf>`__.

    Face value

        In finance, the face value is the nominal value of a financial instrument such as a bond, stock, or currency. For a bond, the face value is the amount that the bond will be worth when it matures. For a stock, the face value is the original value assigned to the stock when it is issued. For currency, the face value is the value printed on the currency.

        For example, Digital Currency Group took over the defaulted Three Arrows Capital
        loan of $1.1B from its subsdiary Genesis
        `at its face value <https://twitter.com/ramahluwalia/status/1613040794725670914>`__
        even though
        it is unlikely the money will ever be recovered. The fair value
        of this loan would have been much less.

        See also :term:`Fair value`.

    Fair value

        In finance, fair value is an estimate of the intrinsic value of an asset or liability, based on the most recent market data or other relevant information. The concept of fair value is used to measure the value of an asset or liability that is not traded in an active market, such as in accounting and financial reporting.
        It's the estimated amount for which an asset or liability should exchange on the measurement date between a willing buyer and a willing seller in an arm's-length transaction.
        It's used for financial reporting and taxes, among other purposes. The calculation can be complex, as it often involves estimates and assumptions about future events, such as cash flow projections, volatility, risk, and other factors.

        For example, Digital Currency Group took over the defaulted Three Arrows Capital
        loan of $1.1B from its subsdiary Genesis
        `at its face value <https://twitter.com/ramahluwalia/status/1613040794725670914>`__
        even though
        it is unlikely the money will ever be recovered. The fair value
        of this loan would have been much less.

        See also :term:`Face value`.

    Liquidity mining

        Liquidity mining is a process where :term:`AMM` liquidity providers for a token are subsidised
        from a token treasury. Effectively, you are paying people to create liquidity in an AMM pool or
        an order book.

        This is to bootstrap the liquidity from zero to meaningful level, so that users and traders
        can enter and exit positions without significant :term:`price impact`. The liquidity mining
        program assumes that after a certain liquidity level is artificially bootstrapped,
        it can maintain itself better as it has attracted active traders with larger capital pools
        who now have started to trade the token.

    Mercenary capital

        Mercenary capital is a term used to refer to cryptocurrency investment and trading funds
        who chase :term:`liquidity mining` and other token rewards without long term commitment
        to the token success. Mercenary capital moves from a project to a project, chasing
        best subsidised yields without actually contributing to the token success any way.

    Poetry

        Poetry is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Poetry offers a lockfile to ensure repeatable installs, and can build your project for distribution.

        `Read more in Poetry documentation <https://python-poetry.org/docs/>`__.

    Google Colab

        Google Colab is a free Jupyter notebook environment that runs entirely in the cloud.
        It does not require a setup and allows users to combine executable code, rich text, images, HTML, LaTeX and more in a single document.
        It provides free access to GPU's and TPU's for anyone who needs them to build machine learning or deep learning models.

        `Read more <https://research.google.com/colaboratory/>`__.

    PyCharm

        PyCharm is an integrated development environment (IDE) used for programming in Python.
        It provides code analysis, a graphical debugger, an integrated unit tester, integration with version control systems, and supports web development. PyCharm also has a free version specifically designed for education purposes. PyCharm supports Jupyter Notebooks well.

        `Read more <https://www.jetbrains.com/pycharm/>`__

    Visual Studio Code

        Visual Studio Code (VS Code) is a source-code editor made by Microsoft for Windows, Linux and macOS. . VS Code is free and optimized for building and debugging modern web and cloud applications. It comes with features such as code editing, debugging, integrated Git control, syntax highlighting, intelligent code completion, snippets, and more. Visual Studio Code
        is excellent for editing Jupyter notebooks.

        `Read more <https://code.visualstudio.com/>`__

    CEX

        CEX is an acronym for a centralised cryptocurrency exchange.

        It is the opposite of :term:`DEX`. In a centralised cryptocurrency exchange,
        the exchange takes custody of your assets in non-transparent manner. You are 100%
        trusting that the exchange does not have technical issues or fraud issues
        what comes to managing your assets.

    MEV

        Miner Extractable Value (MEV) is a measure of the profit a blockchain block producer can make through their ability to arbitrarily include, exclude, or re-order transactions during the block production process. It refers to the maximum amount of value that can be extracted from block production in excess of the standard block reward and gas fees.

        Because of block producers ability to reorder trades in a single leader blockchain consensus
        models, MEV causes negative slippage and other issues for traders.

    Rebase token

        Rebase tokens, also known as elastic tokens, are cryptocurrencies whose supply is algorithmically adjusted in order to control its price. They adjust their circulating supply in response to price fluctuation and are designed in a way that the circulating token supply adjusts (increases or decreases) automatically according to a predetermined formula.

        `An example of a rebase token is Klima <https://tradingstrategy.ai/trading-view/polygon/tokens/0x4e78011ce80ee02d2c3e649fb657e45898257815>`__.

