.. _glossary:

Glossary
========

Here you can find terminology used in the documentation, decentralised finance
and algorithmic trading.

.. glossary::
    :sorted:


    Trading strategy

        A trading strategy is a fixed plan that is designed to achieve a profitable return by going long or short in markets.

        It involves analysis to identify specific market conditions and price levels.
        There are many different types of trading strategies, such as

        - Moving-average cross strategies like :term:`EMA`

        - Trend-following

        - Market-making (see :term:`AMM` for :term:`decentralised finance`)

        - Arbitrage

        - Scalping

        - Portfolio construction model

        - :term:`Market neutral <Market neutral strategy>`

        - :term:`Yield farming`

        Further strategies can be classified by their activity and risk profile as

        - :term:`Directional strategies <directional strategy>`

        - :term:`Active strategies <active strategy>`

        - :term:`Passive strategies <passive strategy>`

        The trading strategy can be automated as :term:`algorithmic trading` and thus
        become :term:`automated trading strategy`.

        Trading Strategy can also refer to `Trading Strategy protocol <https://tradingstrategy.ai>`__
        that offers :term:`non-custodial` :term:`algorithmic trading` to its users.

        See also

        - :term:`Algorithmic trading`

        - :term:`Technical analysis`

        - :term:`Automated trading strategy`

        - :term:`Best trading algorithm`

        - :term:`Alpha generation platform`

        - :term:`Equity curve`

        - :term:`High-frequency trading`

        - :term:`Market neutral strategy`

        - :term:`Factor investing`

        - :term:`Yield farming`


    AMM
        Automated market maker (AMM) is a :term:`bonding curve` based :term:`decentralised exchange`.

        An automated market maker (AMM) is a type of decentralised exchange (DEX) that uses algorithmic smart contracts to make it easy for individual traders to buy and sell crypto assets. Instead of trading directly with other people as with a traditional order book, users trade directly through the AMM. AMMs facilitate the decentralised exchange of digital assets using liquidity pools rather than conventional market order books.

        AMMs can be often seen as the opposite of :term:`order book` markets.
        In an AMM, the user is trading against :term:`liquidity pool`.

        AMMs can be

        - :term:`Bonding curve` based using :term:`XY liquidity model`.

        - :term:`CLMM` based using concentrated liquidity model

        Example AMMs include Uniswap, Curve, Sushi, Trader Joe.

        See also

        - :term:`Decentralised exchange`

        - :term:`Decentralised finance`

        - :term:`XY Liquidity Model`

        - :term:`Order book`

        - :term:`Liquidity pool`

        - :term:`Swap`

        - :term:`Liquidity provider`

    CLMM

        CLMM stands for Concentrated Liquidity Market Maker.

        CLMM is a form of :term:`AMM`.
        CLMMs provide more capital-efficient :term:`liquidity` on a :term:`DEX`.

        It allows :term:`liquidity providers <liquidity provider>` to set specific price ranges,
        add single-sided liquidity and do range order trading,
        similar to :term:`order books <order book>`.

        See also

        - :term:`AMM`

        - :term:`Decentralised exchange`

        - :term:`XY Liquidity Model`

        - :term:`Order book`

        - :term:`Liquidity pool`

        - :term:`Swap`

        - :term:`Liquidity provider`

    On-chain

        In :term:`decentralised finance`, on-chain refers to transactions or activities that are recorded and processed directly on a blockchain network. It is the opposite of :term:`off-chain`.

        In a blockchain, transactions are verified by nodes in the network and added to the chain of blocks that make up the blockchain. These transactions are permanent and unalterable, and the state of the blockchain can be seen by anyone on the network.
        
        When an activity is referred to as "on-chain," it means that it is recorded directly on the blockchain, as opposed to off-chain, which refers to transactions or activities that are not recorded on the blockchain but are still facilitated by the network.
        
        On-chain transactions are typically considered to be more secure and transparent than off-chain transactions, as they are recorded in a public ledger that is immutable and auditable. Additionally, on-chain transactions are often processed more quickly and with lower fees than off-chain transactions, as they do not require intermediaries or intermediating networks.

        Examples of on-chain activities include cryptocurrency transfers, smart contract execution, and decentralised applications (dApps). These activities are all processed directly on the blockchain network, providing a secure and transparent means of conducting transactions and executing code.


        See also

        - :term:`Off-chain`

        - :term:`Decentralised finance`

        - :term:`Wallet`

        - :term:`Decentralised exchange`

    Off-chain

        In :term:`decentralised finance`, off-chain refers to software and code that is run outside the blockchain nodes.

        Off-chain activities are needed because some activities are not possible or too expensive (transaction cost wise)
        to handle in a blockchain core protocol or smart contracts:

        - Computation cost using smart contracts would be too high due to CPU, IO and memory requirements.

        - Information needs to be fetched for :term:`real-world assets <RWA>` or other items
          that do not have native blockchain data, like centralised exchange cryptocurrency prices.
          Because blockchains are new technology, most things in the world do not have good blockchain
          data available yet and off-chain data fetch and validation is needed.

        In the future, the amount of activities that need off-chain computation is going to decrease,
        as blockchains are getting more powerful.

        Usual off-chain computation use cases include

        - :term:`Price oracles <oracle>`

        - :term:`Order books <order book>` run on a centralised server like 0x protocol or DyDx

        See also

        - :term:`On-chain`

        - :term:`Decentralised finance`

        - :term:`Decentralised exchange`

        - :term:`RWA`

    Backtest

        Simulating the efficiency of a :term:`trading strategy` against historical data.

        Backtesting is the process of analysing historical trade data to see how a trading strategy would have performed statistically in the past. It is a key component of effective trading system development and can be used to test a trading hypothesis/strategy on the historical data.

        See also

        - :term:`Historical market data`

        - :term:`OHLCV`

        - :term:`Dataset`

        - :term:`Trading strategy`

    Decentralised exchange

        Decentralised exchange (DEX) is an asset trading exchange where all trades happen purely :term:`on-chain`.

        These exchanges are public, fair, cheap and especially censorship proof.
        There is no middleman like a broker when you are trading on these venues, but you get equal access to the trade flow.
        Users trade using their :term:`non-custodial <non-custodial>` :term:`wallets <wallet>` performing :term:`swaps <swap>`.

        A decentralised exchange is an opposite of :term:`CEX`. Decentralised exchanges are always
        :term:`smart contract` based.

        Decentralised exchanges can be based on different models:

        - term:`AMM`

        - term:`CLMM`

        - term:`Order book`

        Some of the most popular decentralised exchanges are Uniswap, Sushiwap and PancakeSwap.

        See also

        - :term:`Decentralised finance`

        - :term:`CEX`

        - :term:`Liquidity provider`

        - :term:`Swap`

        - :term:`Non-custodial`

        - :term:`Smart contract`

        - :term:`ERC-20`

        - :term:`On-chain`

        - :term:`Wallet`

    Autonomous agent

        An autonomous agent is a software program or system that can operate independently and make decisions on its own, without direct intervention from a human. This type of technology is designed to perform specific tasks or functions, such as data processing, problem-solving, decision-making, and even physical actions.

        Autonomous agents typically use artificial intelligence (AI) and machine learning algorithms to analyse data, make decisions, and interact with the environment. They are designed to work in complex, dynamic environments, and can respond to changes in real-time.

    Smart contract
    
        Smart contract is automated transactional service running on any of the blockchains.

        A smart contract contains the terms of the agreement between parties, and automatically executes the terms when certain predetermined conditions are met. Smart contracts are tamper-proof, transparent, and autonomous, and they eliminate the need for intermediaries such as lawyers, brokers, or banks. This makes them a secure and efficient way to automate financial transactions, manage digital assets, or automate other types of agreements

        An automated transactional service running on any of the blockchains supporting smart contracts. Typically
        runs on Ethereum-based blockchain and is written in the Solidity programming language.

        See also

        - :term:`On-chain`

        - :term:`Non-custodial`

        - :term:`Wallet`

    Jupyter notebook

        Jupyter Noteook is a popular :term:`Python` based data science tool.

        Jupyter allows users to run data research :term:`notebooks <notebook>` interactively.

        Jupyter notebooks can be easily shared, run on your local computer or on a hosted cloud environment, both free and paid.

        Jupyter is an especially popular software development tool among :term:`quants <quant>`.

        `More information on Jupyter website <https://jupyter.org/>`__.

        See also

        - :term:`Python`

        - :term:`Trading Strategy`

        - :term:`Pandas`

    Pandas

        Pandas is a powerful and widely used open-source data analysis library in :term:`Python`. It provides data structures and functions needed to work with structured data, such as tabular data in the form of tables or spreadsheets. With pandas, it's easy to manipulate, clean, and analyse data, as well as perform complex operations such as grouping, merging, and aggregating data.
        
        Pandas is designed to handle a variety of data types, including numerical, categorical, and time-series data. It also integrates well with other libraries, such as NumPy and Matplotlib, making it a popular choice for data analysis and visualisation in the scientific and research communities.
        
        One of the key features of pandas is its DataFrame object, which is a two-dimensional labelled data structure with columns of different data types. With pandas, you can easily perform operations on the DataFrame such as filtering, sorting, and grouping data, as well as handling missing values and dealing with time-series data. `More information <https://pandas.pydata.org/>`__.

        See also

        - :term:`Python`

        - :term:`Trading Strategy`

        - :term:`Jupyter Notebook`

    Uniswap

        The most popular :term:`AMM` based :term:`decentralised exchange`. Uniswap has two major versions.
        In version 2 (v2) the liquidity is evenly distributed across the bonding curve. In version 3, the
        liquidity providers can have liquidity on a partial curve, simulate order book and have better
        capital efficiency. Most decentralised exchanges are Uniswap v2 :term:`clones <clone>`.

        See also

        - :term:`Decentralised exchange`

        - :term:`Decentralised finance`

        - :term:`Smart contract`

        - :term:`On-chain`

        - :term:`AMM`

        - :term:`CLMM`

    Clone

        Fork is a a product launched based on the open source code of another existing product. Also known as fork.

        See :term:`fork` for details.

    Fork

        Fork is a a product launched based on the open source code of another existing product.

        In the context of :term:`on-chain` forks, forks usually are hostile to the original project and competes from the
        same users. Forks often do not innovate, or make the product technically better.

        Unlike traditional open source projects, fork rarely co-operate. Because many forks
        lack the same technical understanding as the original founding tech team, forks suffer from hacks
        and are often abandon after a short period of time.

        Examples of forks include :term:`BNB Chain` and :term:`Sushi`.

        See also

        - :term:`Decentralised finance`

        - :term:`BNB Chain`

        - :term:`Sushi`

    Candle

        Candle, or a candlestick is a type of price chart used in technical analysis that displays the high, low, open, and closing prices of an asset for a specific time period, or :term:`bucket`.

        `More information on Wikipedia <https://en.wikipedia.org/wiki/Candlestick_chart>`__.

        See also

        - :term:`OHLCV`

        - :term:`Bucket`

    Bucket

        The (time) bucket to a time period for :term:`candle` data.

        For example, you can have one minute, one hour or time buckets, describing for the what period of a time the candle includes the trades.

        Also known as time frame, candle length or candle duration.

        See also

        - :term:`OHLCV`

        - :term:`Bucket`

        - :term:`Trading strategy`

    OHLCV

        A typical :term:`candle` contains open, high, low and close price and trade volume for a :term:`time bucket <bucket>`. Because on-chain exposes more data than centralised exchanges, Trading Strategy data also contains individual buys and sells, US dollar exchange rate and so forth.

        See also

        - :term:`Candle`

        - :term:`Bucket`

        - :term:`Trading strategy`

    Parquet

        Parquet is a columnar storage format for big data processing and analysis, commonly used in the Apache Hadoop and Apache Spark ecosystems. It is optimised for fast querying and efficient storage of large, complex data sets, and supports a wide range of data formats and compression options. By organising data into columns rather than rows, Parquet enables more efficient compression and encoding, as well as improved query performance, making it a popular choice for data warehousing and analytics applications. `More information <https://parquet.apache.org/>`__.

    Pyarrow

        Python API for :term:`Arrow` library. `More information <https://arrow.apache.org/docs/python/>`__. PyArrow is an open-source Python library that provides a fast, efficient way to process and analyse large datasets, especially those in Apache Arrow format. It is used for handling columnar and/or chunked data in memory, including reading and writing data from/to disk and interprocess communication. PyArrow also provides a rich set of data structures and algorithms for working with arrays, tables, and data frames, as well as support for various data formats such as Parquet, Avro, ORC, and others. The library is designed to be highly performant and can be used in a variety of applications, including data science, machine learning, and data engineering.

    Arrow

        Apache Arrow is an open-source, cross-platform columnar data format that is used for storing and processing large amounts of data efficiently. It was designed to address some of the performance and scalability challenges associated with traditional row-based data storage and processing methods.

        Arrow provides a common format for storing data, which can be used across multiple platforms and programming languages, including C++, Java, Python, and R. This allows for faster data processing and improved performance, as data can be shared and processed efficiently between different applications and systems.

        In addition to its performance benefits, Arrow also provides a number of other advantages, such as support for a wide range of data types and low overhead. This makes it well-suited for use in big data and analytics applications, as well as other data-intensive projects.

        `More information <https://arrow.apache.org/docs/index.html>`__.

    Dataclass

        A dataclass is a type of class in the programming language Python that is used to define data structures. It provides a convenient and efficient way of representing structured data, such as records, tuples, or database tables. Dataclasses allow for the creation of classes with automatically generated special methods, such as the `__init__`, `__repr__`, and `__eq__` methods, which are commonly used for defining classes that represent data.

        With dataclasses, developers can declare fields and their types using the `@dataclass` decorator and the `field` function. This reduces the amount of boilerplate code that needs to be written and makes it easier to maintain and update the code. Additionally, dataclasses provide the ability to add default values for fields, define ordering using the `order` function, and customise the representation of the class using the `repr` function.

        Dataclasses were introduced in Python 3.7 and are considered a modern and convenient way of defining data structures in Python. They can be used in a variety of applications, including data analysis, machine learning, and web development.

        `More information <https://realpython.com/python-data-classes/>`__.

    Dataset

        A data bundle consisting of :term:`candles <candle>` or other quantitative data sources.
        The most usual dataset is hourly or daily candles for multiple assets, distributed as a downloadable archive of several hundreds of megabytes.

    Dataset server

        The server than indexes blockchains and creates :term:`candle` and other :term:`datasets <dataset>` for research, analysis and trade execution. Currently centralised and you need an API key to access.

    Notebook

        A notebook is a web-based interactive platform for writing and running code, as well as documenting and sharing work in a variety of formats, including text, code, and graphics. It is commonly used in the fields of data science, machine learning, and scientific computing for developing and testing algorithms, analysing data, and creating visualisations.
        
        In a notebook, users can write code in a variety of programming languages, including Python, and run it directly within the platform. The output of the code, including any visualisations or results, is displayed within the notebook alongside the code itself. This allows users to iteratively develop and test their algorithms, as well as document their work in a readable and reproducible format.
        Notebooks also provide a convenient platform for collaboration and sharing, as they can be easily exported and shared as files, or hosted on platforms such as Jupyter or Google Colab. This makes them a popular choice for data scientists and researchers who need to share their work with others, as well as for organisations who need to collaborate on large data projects.

        Overall, notebooks provide a powerful and flexible platform for data analysis, scientific computing, and code development, making them an essential tool for many researchers and data professionals.
        
        The format was popularised by :term:`Jupyter notebook`.

    Strategy

        In a :term:`decentralised finance`, strategy refers to :`trading strategy`.

        See :term:`trading strategy`.

    Technical analysis

        Technical analysis is a trading discipline employed to evaluate investments and identify trading opportunities by analysing statistical trends gathered from trading activity, such as price movement and volume.

        `More information <https://www.investopedia.com/terms/t/technicalanalysis.asp>`__.

        See also

        - :term:`Trading strategy`

        - :term:`Algorithmic trading`

        - :term:`Best trading algorithm`

    Backtrader

        An old Python based :term:`algorithmic trading` framework for strategy backtesting and live execution.
        No longer maintained.

        `See documentation <https://www.backtrader.com/>`__.

    QSTrader

        QSTrader is an old Python based :term:`algorithmic trading` framework.

        QSTrader offers  strategy backtesting and live execution using portfolio construction theory.

        QSTrader is jo longer maintained.

    Fastquant

        Fastquant allows you to easily backtest investment strategies with as few as three lines of Python code. Its goal is to promote data driven investments by making quantitative analysis in finance accessible to everyone. Fastquant builds on the top of :term:`Backtrader`. See `Github repository <https://github.com/enzoampil/fastquant>`__.

    Base token

        A base token, in the context of cryptocurrencies, refers to the primary token or asset used in a specific :term:`trading pair` or exchange. The base token is the token that is being traded or exchanged for another token, typically a quote token,  see also :term:`quote token`. For example, in the trading pair BTC/USD, BTC is the base token and USD is the quote token. The price of the quote token is quoted in terms of the base token.

        The base token is an important concept in the cryptocurrency market, as it determines the value of the other token in a trading pair. In other words, the price of the quote token is derived from the price of the base token. This relationship between the base token and the quote token is used to determine the price of the quote token, which can then be used to determine the value of other assets that are pegged to it.

        See also

        - :term:`Trading pair`

        - :term:`Quote token`

        - :term:`Decentralised exchange`

        - :term:`ERC-20`

    Quote token

        The token that acts as a nominator for the price when you are buying or selling. Usually this is more well-known token of the pair: ETH, BTC or any of various USD stablecoins. See also :term:`base token`.

        See also

        - :term:`Trading pair`

        - :term:`Base token`

        - :term:`Decentralised exchange`

        - :term:`ERC-20`

    Liquidity

        Liquidity refers to the depth of the order books: how much volume a single trade can achieve without moving the price.

        It can be expressed as :term:`slippage` or absolute depth of the order book. The latter is very easy for :term:`AMM` based exchanges where the liquidity is a continuous function.

        Trading Strategy provides :term:`datasets <dataset>` for :term:`AMM` liquidity.

        See also

        - :term:`Trading pair`

        - :term:`Liquidity pool`

        - :term:`Swap`

        - :term:`Swap fee`

    Yield farming

        Yield farming is a :term:`passive trading strategy <passive strategy>` in :term:`decentralised finance`.

        Usually yield farming strategies rely on :term:`on-chain` :term:`liquidty pools <liquidity pool>` and liquidity mining token distributions,
        which where any tokens are immediately sold. Strategies can be :term:`auto-compounding`.

        Yield farms operate solely on smart contracts and their strategies are limited.

        Yield farms almost always aim for :term:`risk-free rate` against their :term:`quote token`.

        See also

        - :term:`Passive strategy`

        - :term:`Exposure`

        - :term:`Smart contract`

        - :term:`Decentralised finance`

        - :term:`Trading strategy`

        - :term:`Risk-adjusted return`

        - :term:`Market neutral strategy`

        - :term:`Token distribution`

        - :term:`Liquidity mining`

        - :term:`Mercenary capital`

    Exposure

        The risk of a strategy for the volatility of a particular asset. For example, if you have 100% exposure to ETH and ETH prices drops to zero, you lose all of your money.

    Market neutral strategy

        Market neutral strategies are trading strategies that have little or no :term:`exposure` to crypto asset volatility. They are often :term:`high-frequency trading` strategies, like arbitrage. Good market neutral strategies can make 10% - 20% monthly yield in cryptocurrency markets.

    High-frequency trading

        High-frequency trading, or HFT for short, is a :term:`trading strategy` where you compete with technical speed.

        HFT strategies include arbitration, cross-market market making or such and compete against the other actors with your technical speed.
        In :term:`decentralised finance`, there is a special category of high-frequency trading called :term:`MEV`.

        See also

        - :term:`Trading strategy`

        - :term:`MEV`

        - :term:`Algorithmic trading`

        - :term:`Market neutral strategy`

    Directional strategy

        A directional strategy is a type of trading or investment strategy that involves taking a bullish or bearish view on a particular asset or market.

        This means that the strategy is based on the expectation of the asset or market moving in a specific direction, either up or down.
        
        Directional strategies are typically used by traders and investors who are trying to profit from market movements. They can take various forms, including long positions (where an investor buys an asset with the expectation that its price will increase), short positions (where an investor sells an asset with the expectation that its price will decrease), or a combination of both.
        
        Some common examples of directional strategies include trend-following, momentum trading, and breakout trading. These strategies often involve using technical analysis, fundamental analysis, or both to identify market trends, momentum, or key price levels, and to make investment decisions.

        See also

        - :term:`Trading strategy`

        - :term:`Active strategy`

    Active strategy

        Active strategy in relation to algorithmic trading refers to a type of investment or trading approach that uses algorithms to make regular, data-driven decisions about buying and selling assets. This approach is designed to generate higher returns and outperform passive investment strategies.

        Active strategies in algorithmic trading differ from passive strategies, which simply follow the market and hold assets for the long-term, in that they actively seek to generate higher returns through regular buying and selling of assets. This can involve taking advantage of short-term market movements, or making trades based on a variety of market indicators and economic data.

        `Read more <https://www.investopedia.com/articles/active-trading/11/four-types-of-active-traders.asp>`__.

        See also

        - :term:`Trading strategy`

        - :term:`Directional strategy`

        - :term:`Passive strategy`

    Passive strategy

        Passive investing is a long-term :term:`trading strategy` for building wealth by buying securities that mirror stock market indexes and holding them long term.

        A passive strategy involves minimal trading in the market, with investors buying and holding a diversified mix of assets to match, but not beat, the performance of an index.
        The passive investing strategy is based on the premise that a low-cost, well-diversified portfolio will produce an average market return.

        Often, in :term:`decentralised finance`, passive strategies aims to beat :term:`risk-free rate` without any additional :term:`exposure`
        and :term:`drawdown`.

        See also

        - :term:`Trading strategy`

        - :term:`Active strategy`

        - :term:`Yield farming`

        - :term:`Exposure`

        - :term:`Drawdown`

    Non-custodial

        Non-custodial means that a third party does not have ownership of your assets in a service.

        A non-custodial model usually means s smart contract based service model where the owner of the assets never lose the control of the assets. This is opposite to most traditional finance services where you cannot see what happens to your money after the deposit or whether you are able to withdraw. The integrity of the service provider in the traditional finance thus needs to be guaranteed through regulation or government bailouts. The non-custodial model is specific to smart contracts and cannot be achieved without a blockchain. `Read more <https://stackoverflow.com/questions/65009246/what-does-non-custodial-mean>`__.

        Non-custodial protocol models have become popular in a blockchain, after FTX and Celsius blow-ups: not your keys, not your coins.

        See also

        - :term:`Wallet`

        - :term:`Custodial`

        - :term:`Decentralised finance`

    Traditional finance

        In :term:`decentralised finance`, traditional finance or TradFi, refers to the old financial system.

        TradFi consists of regulated securities markets, banks, commodities and FX markets.
        TradFi markets are considered to be inefficient compared to :term:`decentralised finance`,
        due to excessive amount of middlemen, :term:`custodials <custodial>` and  lack of automation.

        See also

        - :term:`Decentralised finance`

        - :term:`Decentralised exchange`

        - :term:`Lending protocol`

        - :term:`On-chain`

    Private strategy

        A trading strategy where the source code of the strategy is not disclosed to the public. Private strategies can still be :term:`non-custodial` and enjoy the benefits of Trading Strategy protocol trade execution and fee distribution.

    Risk-free rate

        The expected return for the money that is considered (almost) risk-free.

        In traditional finance, the risk-free rate is considered to be treasury note or government bond yield, although you still have some risks like the sovereignty risk.

        In :term:`decentralised finance`, a risk-free rate is considered to be an US dollar :term:`lending pool` rate, like one you would get from :term:`Aave` :term:`USDC` pool.

        See also

        - :term:`Stablecoin`

        - :term:`Lending pool`

        - :term:`Passive strategy`

        - :term:`Drawdown`

    Drawdown

        How much in percent terms the asset goes or can go down.

        Drawdown refers to the peak-to-trough decline in the value of an investment, usually measured as the percentage of an investment's peak value. It is a measure of the risk of an investment, as it indicates the amount that an investment can decline before it reaches a new high. Drawdown can also refer to the period of time during which an investment's value is in decline.

        See also

        - :term:`Maximum drawdown`

        - :term:`Risk-adjusted return`

    Maximum drawdown

        Maximum drawdown (MDD) is the largest peak-to-trough decline in the value of an investment over a specific period of time.

        The maximum :term:`drawdown` is how much your portfolio goes down in the examination period,
        or maximum amount of loss if you had entered and exited at the worst possible moment.

        It is a measure of the risk of an investment, as it indicates the largest amount that an investment can decline from its highest point to its lowest point during a specific period of time. MDD is typically used to measure the risk of a portfolio or investment strategy, and is often expressed as a percentage of the investment's peak value.

        As a rule of thumb, the maximum drawdown should not be more than 1/3 of the strategy annual returns.

        See also

        - :term:`Trading strategy`

        - :term:`Drawdown`

        - :term:`Risk-adjusted return`


    USDC

        USDC (USD Coin) is a :term:`stablecoin`, meaning it is a cryptocurrency that is pegged to the value of the US Dollar. It is designed to maintain a value of 1 USDC = 1 USD, and its value is backed by US dollars held in reserve. USDC is used for a variety of purposes in the cryptocurrency space, including as a unit of account for trading, for remittances and as a medium of exchange. It operates on the Ethereum blockchain and is a popular choice for traders looking for a stable store of value in the cryptocurrency markets.

        `Read more <https://www.circle.com/en/usdc>`__.\

        See also :term:`stablecoin`.

    Stablecoin

        A stablecoin is a type of cryptocurrency whose value is tied to an asset such as the U.S. dollar or gold to maintain a stable price.
        Stablecoins aim to provide price stability and reduce volatility compared to other cryptocurrencies.

        Example stablecoins include

        - Circle USD - :term:`USDC`.

        - Binance dollar - BUSD

        - Tether dollar - USDT

        See also

        - :term:`ERC-20`

        - :term:`Wallet`

    Pine Script

        A proprietary trading strategy programming language for :term:`TradingView`. `Read more <https://www.tradingview.com/support/solutions/43000561836-what-is-pine-script/>`__. Pine Script is a high-level scripting language that is specifically designed for use in creating custom trading indicators and strategies for financial markets. It is used by traders to create custom technical indicators, such as moving averages, Bollinger Bands, and Relative Strength Indicators, as well as more complex algorithms for automated trading.

    TradingView

        Trading view is the world most popular trading strategy platform. It lets you discover investment ideas and showcase your talents to a large and active community of traders. Easy and intuitive for beginners, and powerful enough for advanced chartists. Trading View has all the charting tools you need to share and view trading ideas. Real-time data and browser-based charts let you do your research from anywhere, since there are no installations or complex setups. `Read more <https://www.quora.com/What-is-TradingView>`__.

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

        Price impact is the difference between the current market price and the price you will actually pay when performing a swap on a decentralised exchange.

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

    Mid Price

        The mid price, in the context of AMM, is the price that reflects the ratio of reserves in one or more pairs. There are three ways we can think about this price. Perhaps most simply, it defines the relative value of one token in terms of the other. It also represents the price at which you could theoretically trade an infinitesimal amount (ε) of one token for the other. Finally, it can be interpreted as the current market-clearing or fair value price of the assets.

        The mid price, in the context of order book based exchange is :math:`(best bid + best ask) / 2`,
        i.e. the price between the best sell offer and the best buy offer.

        `More information about the mid price on Uniswap documentation <https://docs.uniswap.org/sdk/2.0.0/guides/pricing>`_.

    Rug pull

        A project where the development team or founders decide to maliciously cash out early, not
        fulfilling their promises and disappear with the investor money.

        A rug pull is a type of crypto scam in which fraudsters lie to the public to attract funding and quickly run off with investors' digital tokens. Developers behind rug pulls often promote their tokens on social media platforms to attract as many retail investors as possible. The name comes from the phrase "pulling the rug out" and involves a developer attracting investors to a new crypto project, then pulling away all liquidity.

        `One of the most famous rug pulls is Anubis ($60M taken) <https://decrypt.co/84924/anubisdao-investors-lose-60-million-in-alleged-rug-pull>`_.

    Strategy cycle

        In :term:`Trading Strategy Framework`, the strategy cycle refers to the timestamped process of developing, testing, and implementing a trading strategy.

        This process typically involves several steps, including research and analysis, design, optimization, backtesting, and live trading. The strategy cycle is an iterative process, and the results of each step can influence the next. The goal of the strategy cycle is to identify and develop a profitable and reliable trading strategy that can be consistently executed. The end result of the strategy cycle is a well-designed, thoroughly tested, and successfully deployed trading strategy that can help achieve investment goals.

        See :term:`cycle duration`.

    Cycle duration

        Cycle duration defines how often the strategy main loop triggers.
        This can be different from the candle :term:`bucket` the strategy is using.
        For example, a strategy can have a cycle duration of 16h and makes
        trades based on 4h candles.

    Enzyme protocol

        Enzyme is a fund back-office protocol for :term:`EVM-compatible` blockchains.

        Enzyme offers :term:`vaults <vault>` where investors can invest to different
        :term:`trading strategies <trading strategy>`. Enzyme protocol is :term:`non-custodial`.

        Read `Enzyme Finance <https://enzyme.finance/>`__ for more information.

        See also

        - :term:`Decentralised exchange`

        - :term:`Lending pool`

    Docker

        Linux process and packaging management framework. Ideal for managing
        long-running server-side processes.

        `See Docker.com for more information <https://www.docker.com/>`__.

    Vault

        In :term:`decentralised finance`, a vault refers to a :term:`smart contract`
        that manages assets, in non-custodial manner, for several stakeholders.
        Usually when you deposit to a vault you receive share or liquidity provider
        tokens as a return.

        `See EIP-4626 Tokenised vault standard <https://eips.ethereum.org/EIPS/eip-4626>`__
        for more information.

        See also

        - :term:`Trading strategy`

        - :term:`Smart contract`

        - :term:`ERC-20`

        - :term:`Non-custodial`

        - :term:`Wallet`

    Technical indicator

        A technical indicator, or just an indicator, is a calculated value
        indicating something about the state of the market.
        Indicators are usually based on :term:`OHLCV` data.
        By combining several indicators through :term:`technical analysis`,
        one can create automated trading strategies.
        An example technical indicator is :term:`EMA (exponential moving average) <EMA>`.

        See :ref:`technical analysis` documentation for Trading Strategy indicator list.

        See also

        - :term:`Trading strategy`

        - :term:`EMA`

    EMA

        Exponential moving average. One of the most common :term:`technical indicators <technical indicator>`.
        By comparing the current price of an asset to the moving average price,
        one can determine if the current price is likely dislodged above or
        below the market trend.

        `See this post for more information on simple and exponential moving average <https://school.stockcharts.com/doku.php?id=technical_indicators:moving_averages>`__.

        See also

        - :term:`Trading strategy`

        - :term:`Technical indicator`

    DeFi

        DeFi stands for :term:`Decentralised finance`.

        See :term:`decentralised finance` for the full description.

    Quantitative finance

        Quantitative analysis is the use of mathematical and statistical methods in finance and investment management. Those working in the field are quantitative analysts (quants). Quants tend to specialise in specific areas which may include derivative structuring or pricing, risk management, algorithmic trading and investment management.

        `Read more <https://en.wikipedia.org/wiki/Quantitative_analysis_(finance)>`__.

    Python

        One of the most popular and loved programming languages.
        Python is the number one programming language in :term:`quantitative finance`.
        
        Python is a high-level, interpreted programming language known for its readability, simplicity, and versatility. It was first released in 1991 and has since become one of the most widely used programming languages in the world. Python is used for a variety of applications, including web development, scientific computing, data analysis, artificial intelligence, and more. It has a large standard library and a supportive community, making it easy to learn and use. Python is also highly extensible, allowing developers to add functionality through libraries and modules. With its clean syntax, readable code, and ease of use, Python is a popular choice for both beginner and experienced programmers.

        `Read more <https://python.org>`__.

    Market data feed

        A time-series data on which automated trade decisions are based on.
        One of the most common data feeds is the price data as :term:`OHLCV` :term:`candles <candle>`.

    Deterministic

        In mathematics, computer science and physics, a deterministic system is a system in which no randomness is involved in the development of future states of the system. A deterministic model will thus always produce the same output from a given starting condition or initial state.

        `Read more <https://en.wikipedia.org/wiki/Deterministic_system>`__.

    Position

        In :term:`trading strategy`, a position means a :term:`long <longing>` or :term:`short <shorting>` position of a particular
        asset betting the price of an asset goes up or down.

        In long positions,
        the trader expects the asset price go up, or appreciate. In short positions,
        the trade expects the asset price go down.

        A position can be a :term:`spot market` position or a :term:`levered <leverage>` position.

        See also

        - :term:`Trading strategy`

        - :term:`Shorting`

        - :term:`Longing`

        - :term:`Leverage`

    Trading universe

        A trading universe describes all possible assets available for a :term:`strategy`
        for its to take different :term:`trading positions <position>`. The simple
        trading strategies trade only a single trading pair like ETH/USD. More complex
        strategies can have trading universe consisting of thousands of trading pairs
        and assets.

    Factor investing

        Factor investing is an investment approach that chooses securities based on attributes that have historically been associated with higher returns.

        There are two main types of factors: macroeconomic and style. Investing in factors can help improve portfolio outcomes, reduce volatility and enhance diversification.

        `Read more <https://learn.aikido.finance/blog/post/how-to-choose-an-algorithmic-trading-strategy-stocks/>`__.

        See also

        - :term:`Portfolio construction`

    Alpha generation platform

        An alpha generation platform is a technology used in algorithmic trading to develop quantitative financial models, or trading strategies, that generate consistent returns.

        Alpha generation platforms are tools used by hedge funds, banks, CTAs and other financial institutions to help develop and test quantitative trading strategies.
        Alpha generation platforms support quants in the creation of efficient and productive quantitative trading strategies.

        `Read more <https://en.wikipedia.org/wiki/Alpha_generation_platform>`__.

        See

        - :term:`Alpha model`

        - :term:`Portfolio construction`


    Native token

        Also known as "gas token". The native token is the cryptocurrency used to pay
        transaction fees on :term:`EVM-compatible` blockchain. For Ethereum it is ETH,
        for Polygon it is MATIC and for Binance Smart Chain it is BNB.

        See also

        - :term:`ERC-20`

        - :term:`Base token`

        - :term:`Quote token`

    TWAP

        TWAP or Time-weighted Average Price is a calculation that defines the weighted average price over a specified period.

        The real-time price of decentralised exchanges is subject to quite easy manipulation, especially within the
        range of one block. A manipulator can use flash loans to access large amount of capital and make trades
        that a normal trader would not do.

        These kind of attacks may cause very high/low price candles. Using the TWAP price mitigates
        the risk of performing e.g. an unnecessary :term:`stop loss` trigger on a manipulated price.

        `On the security and compromises of price oracles <https://ethereum.stackexchange.com/a/114990/620>`__.

        `Read Uniswap v3 TWAP oracle manipulation cost <https://github.com/euler-xyz/uni-v3-twap-manipulation/blob/master/cost-of-attack.pdf>`__.

        See also

        - :term:`Trading strategy`

    Face value

        In finance, the face value is the nominal value of a financial instrument such as a bond, stock, or currency. For a bond, the face value is the amount that the bond will be worth when it matures. For a stock, the face value is the original value assigned to the stock when it is issued. For currency, the face value is the value printed on the currency.

        For example, Digital Currency Group took over the defaulted Three Arrows Capital
        loan of $1.1B from its subsidiary, Genesis
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
        from a token treasury.

        Effectively, you are paying people to create liquidity in an :term:`AMM` :term:`trading pair` or
        an :term:`order book`.

        This is to bootstrap the liquidity from zero to meaningful level, so that users and traders
        can enter and exit positions without significant :term:`price impact`. The liquidity mining
        program assumes that after a certain liquidity level is artificially bootstrapped,
        it can maintain itself better as it has attracted active traders with larger capital pools
        who now have started to trade the token.

        See also

        - :term:`Token distribution`

        - :term:`Airdrop`

        - :term:`Yield farming`

        - :term:`Trading pair`

    Mercenary capital

        In :term:`decentralised finance`, mercenary capital is a term used to refer to cryptocurrency investment and trading funds
        who chase :term:`liquidity mining` and other token rewards without long term commitment
        to the token success.

        Mercenary capital moves from a project to a project, chasing
        best subsidised :term:`yield farming` and :term:`liquidity mining` opportunities,
        without actually contributing to the token success any way.

        See also

        - :term:`Yield farming`

        - :term:`Liquidity mining`

        - :term:`Token distribution`

    Poetry

        Poetry is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Poetry offers a lockfile to ensure repeatable installs, and can build your project for distribution.

        `Read more in Poetry documentation <https://python-poetry.org/docs/>`__.

        See also

        - :term:`Python`

        - :term:`Jupyter notebook`

    Google Colab

        Google Colab is a free Jupyter notebook environment that runs entirely in the cloud.
        It does not require a setup and allows users to combine executable code, rich text, images, HTML, LaTeX and more in a single document.
        It provides free access to GPUs and TPUs for anyone who needs them to build machine learning or deep learning models.

        `Read more <https://research.google.com/colaboratory/>`__.

        See also

        - :term:`Python`

        - :term:`Jupyter notebook`

    PyCharm

        PyCharm is an integrated development environment (IDE) used for programming in Python.
        It provides code analysis, a graphical debugger, an integrated unit tester, integration with version control systems, and supports web development. PyCharm also has a free version specifically designed for education purposes. PyCharm supports Jupyter Notebooks well.

        `Read more <https://www.jetbrains.com/pycharm/>`__

        See also

        - :term:`Python`

        - :term:`Jupyter notebook`

    Visual Studio Code

        Visual Studio Code (VS Code) is a source-code editor made by Microsoft for Windows, Linux and macOS. . VS Code is free and optimised for building and debugging modern web and cloud applications. It comes with features such as code editing, debugging, integrated Git control, syntax highlighting, intelligent code completion, snippets, and more. Visual Studio Code
        is excellent for editing Jupyter notebooks.

        `Read more <https://code.visualstudio.com/>`__

        See also

        - :term:`Python`

        - :term:`Jupyter notebook`

    DEX

        DEX is an acronym for :term:`DEcentralised eXchange`.

        For more information see :term:`decentralised exchange` description.

    CEX

        CEX is an acronym for a centralised cryptocurrency exchange.

        It is the opposite of :term:`DEX`. In a centralised cryptocurrency exchange,
        the exchange takes custody of your assets in a non-transparent manner. You are 100%
        trusting that the exchange does not have technical issues or fraud issues
        when it comes to managing your assets.

    MEV

        Miner Extractable Value (MEV) is a measure of the profit a blockchain block producer can make through their ability to arbitrarily include, exclude, or re-order transactions during the block production process. It refers to the maximum amount of value that can be extracted from block production in excess of the standard block reward and gas fees.

        Because of block producers' ability to reorder trades in a single leader blockchain consensus
        model, MEV causes negative slippage and other issues for traders.

        See also

        - :term:`High-frequency trading`

        - :term:`Trading strategy`

    Rebase token

        Rebase tokens, also known as elastic tokens, are cryptocurrencies whose supply is algorithmically adjusted in order to control its price. They adjust their circulating supply in response to price fluctuation and are designed in a way that the circulating token supply adjusts (increases or decreases) automatically according to a predetermined formula.

        `An example of a rebase token is Klima <https://tradingstrategy.ai/trading-view/polygon/tokens/0x4e78011ce80ee02d2c3e649fb657e45898257815>`__.

        See also

        - :term:`Token`

    Honey pot

        In :term:`decentralised finance` a honey pot describes a trading pair or a token
        designed to fool :term:`trading strategies <trading strategy>`. This is made possible
        by :term:`ERC-20` flexibility allowing it to have custom transfer and ownership rules,
        where the token owner and deployer manipulates balances.

        The scams include "buy only" tokens, tokens with :term:`token tax` or
        trading pools where the owner can drain :term:`quote token` away. Usually
        :term:`trading algorithms <trading algorithm>` are baited with "up only" price manipulation
        techniques and wash trading to believe that the trading pair is robust with good momentum
        and volume.

        See also: term:`token tax`.

    Decentralised finance

        Decentralised finance (DeFi) is an emerging financial technology that challenges the current centralised banking system.

        Decentralised finance refers to a set of newly emerging financial products and services that operate on blockchains using cryptocurrency and
        :term:`smart contract` technology.
        DeFi eliminates the fees that banks and other financial institutions charge, making it more accessible to anyone with an internet connection.
        Thus, decentralised finance is the opposite of :term:`traditional finance` (TradFi).

        Decentralised finance activities happen :term:`on-chain`,
        and are protocol based where users connect with their :term:`wallets <wallet>`.
        The underlying concept that DeFi services are :term:`non-custodial` without direct counterparty humans
        and intermediates make them very efficient.

        Decentralised finance can be seen to be a subset of :term:`web3`. If decentralised finance
        trades real-world assets, they are called :term:`RWAs <RWA>`.

        Example decentralised finance protocols includ
        :term:`decentralised exchanges <decentralised exchange>`,
        like :term:`Uniswap` and :term:`lending protocols <lending protocol>` like :term:`Aave`.
        Other famous decentralised finance protocols include Curve, MakerDAO, Compound,
        Euler and SushiSwap.

        See also

        - :term:`Traditional finance`

        - :term:`Decentralised exchange`

        - :term:`Web3`

        - :term:`RWA`

        - :term:`Non-custodial`

        - :term:`On-chain`

        - :term:`Smart contract`

        - :term:`Stablecoin`

        - :term:`Wallet`

    Algorithmic trading

        Algorithmic trading is a method of executing orders using automated pre-programmed trading instructions accounting for variables such as time, price, and volume.

        It involves making trading decisions based on pre-set rules that are programmed into a computer. :term:`Python` is often used for algorithmic trading due to its ability to handle complex calculations and its flexibility. Algorithmic trading strategies can be used to find potential trades and optimise the timing of trades.

        See also

        - :term:`Trading strategy`

        - :term:`Automated trading strategy`

    Automated trading strategy

        Automated trading strategies are computer programs that follow a defined set of instructions to execute trade orders.

        Common automated trading strategies include moving average cross strategies, which buy when the stock price rises above the moving average and sell when it falls below, and trend-following strategies, which follow the mainstream trends and momentum in the market.

        See also

        - :term:`Trading strategy`

        - :term:`Algorithmic trading`

        - :term:`alpha generation platform`

    Trading algorithm

        Algorithmic trading is a method of executing orders using automated pre-programmed trading instructions accounting for variables such as time, price, and volume. Trading algorithms can be fundamentally driven or based on quantitative signals, and can be created using Python with tools such as Trading Strategy.

        See also :term:`algorithmic trading` and :term:`automated trading strategy`.

    Token tax

        A “token” tax is a term often used to describe tokens with transfer fees that cause deflation or redistribute trade profits to the protocol development:

        - Each time a token is transferred, some transferred amount is burned, redirected to a development fund or otherwise “taxed”.

        - Token tax is usually paid by the originator wallet that initiates the transfer. The tax is taken from the sent amount during the transfer: initiated transfer amount > received transfer amount.

        - Token tax may also reduce the token supply, thus creating deflationary tokens. The deflationary assumption comes from the economic theory that by reducing the supply, the value of the goods should go up. The most famous cryptocurrency having such deflationary mechanics is Ethereum and its EIP-1559 burning mechanism.

        - Token tax can redirect some of the transfer and trading fees to the protocol development fund. This can guarantee sustainable protocol development outside any initial fundraising.

        Usually, the token tax term is not used for the native gas token on a blockchain, like Ether (ETH) on Ethereum, where any transfer fee is considered to be a natural part of the core protocol. The token tax term applies to ERC-20-like tokens that historically have lacked transfer fee features. There is no terminology standard, so different terms are applied in different contexts.

        Different % amounts of “taxes” may apply to different types of transactions like buy, sell, and treasury management.

        See also

        - :term:`swap fee`

        - :term:`honey pot`

        `Read more about token tax <https://tradingstrategy.ai/blog/transfer-fees-token-taxes-and-honeypots>`__ in our introduction blog post.
        
    Order book
    
        An order book is a type of market that operates based on an order book, a record of all buy and sell orders for a particular asset.

        In an order book exchange, users can place limit orders, specifying the price and quantity they are willing to buy or sell an asset for. When a matching buy and sell order is found, a trade is executed, and the exchange takes a small fee for facilitating the transaction. Order book exchanges provide more precise price discovery and allow users to take advantage of market inefficiencies, but can suffer from liquidity issues and are more susceptible to front-running and other forms of market manipulation.

        Overall, order book exchanges offer a more traditional trading experience compared to Automated Market Maker (AMM) exchanges, but with the added benefits of being decentralised and secure.

    Stop loss
    
        A stop loss is a trading tool used to limit potential losses on a trade. It is a predefined price level that, when reached, automatically closes a trade in order to prevent further losses. A stop loss allows traders to set a maximum amount of money they are willing to lose on a trade, reducing the emotional stress of managing an open position. For example, if a trader buys an asset at $100 and sets a stop loss at $90, if the price of the asset drops to $90, the trade will automatically be closed, limiting the trader's loss to $10.

        Stop losses are an important risk management tool for traders and investors, helping to limit their potential losses and preserving their capital for future trades.

    Bear market
    
        A bear market is a condition in the stock market where the overall trend is downward and prices are falling. It is characterised by widespread pessimism and negative investor sentiment, leading to a decrease in the prices of securities. In a bear market, most asset classes tend to decline, and it can last anywhere from a few months to several years. During a bear market, it is common for investors to sell their holdings, leading to further declines in prices. The opposite of a bear market is a bull market, where prices are rising and investor sentiment is positive. Bear markets can be caused by various factors, such as economic recession, high unemployment, and declining corporate earnings.

    Bull market
    
        A bull market is a condition in the stock market where the overall trend is upward and prices are rising. It is characterised by widespread optimism and positive investor sentiment, leading to an increase in the prices of securities. In a bull market, most asset classes tend to rise, and it can last anywhere from a few months to several years. During a bull market, it is common for investors to buy assets, leading to further price increases. The opposite of a bull market is a bear market, where prices are falling and investor sentiment is negative. Bull markets can be driven by various factors, such as a strong economy, low unemployment, and rising corporate earnings.

    Mean reversion
    
        A mean reversion strategy is a type of :term:`trading strategy` that assumes that prices of an asset will eventually return to their :term:`average <EMA>` or mean levels over time.

        This strategy is based on the idea that prices tend to move in cycles and that extreme deviations from the average are temporary
        and eventually return to their :term:`historical <historical market data>` average.
        In a mean reversion strategy, a trader buys an asset when its price is lower than its average and sells when the price is higher than its average,
        with the goal of profiting from the reversion to the mean. Mean reversion strategies can be applied to a variety of assets,
        such as stocks, bonds, commodities, and currencies, and are commonly used in quantitative finance and :term:`algorithmic trading`.

        See also

        - :term:`Technical indicator`

        - :term:`Historical market data`

        - :term:`Trading strategy`

        - :term:`Trend`

        - :term:`EMA`


    Swing trading
    
        Swing trading is a type of short-term trading strategy that aims to take advantage of intermediate-term price movements, typically holding positions for several days to a few weeks. The goal of swing trading is to identify trends and ride them for a profit, rather than trying to predict the market's direction in the long-term. Swing traders use technical analysis to identify potential trades, focusing on price patterns, support and resistance levels, and momentum indicators. They typically trade more frequently than long-term investors and hold positions for a shorter period, but with the potential for larger profits or losses. Swing trading can be used in a variety of markets, including stocks, bonds, commodities, and currencies.

    Dollar cost averaging (DCA)
    
        Dollar cost averaging (DCA) is an investment strategy in which an investor divides a larger sum of money into smaller investments, made at regular intervals over a longer period of time. The goal of dollar cost averaging is to reduce the impact of market volatility on the investment portfolio by spreading out the investment over time, rather than investing the entire amount at once.

        For example, an investor who wants to invest $10,000 in a stock may choose to invest $1,000 every month for 10 months, rather than investing the full $10,000 in one lump sum. 

        This approach can help to reduce the impact of short-term market fluctuations and allow the investor to accumulate more shares when prices are low and fewer shares when prices are high.

    Longing

        Longing means to make a trade where one assumes the price of an asset is going up.

        To go long is the opposite of :term:`shorting`.

        - Longs can be be :term:`spot market` purchases (consider it as :term:`1x leverage <leverage>`

        - Longs can be :term:`levered <leverage>` for higher profits on success

        In decentralised finance, you can build a levered long trade using :term:`lending protocols <lending protocol>`.

        See also

        - :term:`Shorting`

        - :term:`Spot market`

        - :term:`Decentralised finance`

        - :term:`Lending protocol`

        - :term:`Trading strategy`

    Shorting
    
        Short selling, also known as shorting or going short, is a :term:`trading strategy` in which an investor borrows as aasset, sells the borrowed asset, and then aims to buy the asset back at a lower price to make a profit.

        The goal of short selling is to profit from a decline in the price of the security being shorted. In a short sale, the investor borrows shares from another investor, typically through a brokerage, and sells the borrowed shares on the open market. If the price of the security drops, the investor can buy the shares back at a lower price and return the borrowed shares to the lender, pocketing the difference as profit. However, if the price of the security increases, the short seller incurs a loss, which can be unlimited.

        Short selling is a high-risk strategy that requires a solid understanding of market dynamics and a careful risk management plan.

        In :term:`decentralised finance`, you can build a short trade using :term:`lending protocols <lending protocol>`.

        See also

        - :term:`Longing`

        - :term:`Decentralised finance`

        - :term:`Decentralised exchange`

        - :term:`Lending protocol`

        - :term:`Trading strategy`

        - :term:`Liquidation`

    Quantitative analysis

        Quantitative analysis is a method of evaluating securities by using mathematical and statistical models. It is a data-driven approach to investment that involves the use of numerical and computational techniques to analyse financial data and make investment decisions.

        Quant traders, use tools such as statistical models, algorithms, and high-frequency trading technology to analyse market data, identify trends, and make predictions about future market movements. They rely on historical data, such as stock prices, interest rates, and economic indicators, to develop their models and test their predictions.
        
        Quantitative analysis is commonly used in the field of finance, particularly in hedge funds and institutional trading desks, and can be applied to a variety of asset classes, including stocks, bonds, commodities, and currencies.

    Quant
    
        Quants are financial professionals who specialise in the use of quantitative methods to analyse financial data and make investment decisions. They are experts in mathematics, statistics, and computer science and use complex models and algorithms to analyse financial data and make predictions about market movements

        Quants work in a variety of settings, including hedge funds, investment banks, and asset management firms, and play a significant role in the field of finance. They use their expertise in data analysis and modelling to develop trading strategies and make investment decisions, often using high-frequency trading technology to execute their trades.

        Quants are known for their ability to analyse large amounts of financial data and make decisions quickly, using a data-driven approach to investment.

        See also

        - :term:`Trading strategy`

        - :term:`Strategy developer`

        - :term:`Quantitative analysis`

    Strategy developer
    
        A strategy developer is a financial professional who designs and implements investment strategies. They are responsible for analysing market data, identifying trends and opportunities, and creating investment plans that aim to achieve specific financial goals. 

        Strategy developers use a combination of quantitative and qualitative analysis to make investment decisions, drawing on their expertise in economics, finance, mathematics, and computer science. They also use a variety of tools and technologies, including statistical models, algorithms, and high-frequency trading systems, to support their work.

        Strategy developers work in a variety of settings, including hedge funds, asset management firms, and investment banks, and may specialise in a specific asset class, such as stocks, bonds, commodities, or currencies. They are typically highly skilled and experienced professionals who have a deep understanding of financial markets and investment strategies. Effective strategy development requires a combination of technical expertise, market knowledge, and creativity, as well as a sound risk management plan to ensure that investment decisions align with the goals and risk tolerance of the investor.

        See also

        - :term:`Quant`

        - :term:`Trading strategy`

        - :term:`Quantitative analysis`
        
    Public trading strategy
    
        A public trading strategy is an investment approach that is disclosed to and available for use by the general public. This type of strategy is often marketed and sold through books, courses, seminars, or other educational materials. Public trading strategies are designed to provide individuals with a set of guidelines and rules for making investment decisions in financial markets. They typically involve the use of technical analysis, fundamental analysis, or a combination of both to identify opportunities in various asset classes, such as stocks, bonds, commodities, or currencies.

        Public trading strategies may also incorporate elements of quantitative analysis, using mathematical models and algorithms to analyse market data and make predictions about market movements. The goal of a public trading strategy is to provide individuals with a systematic approach to investing that can help them achieve their financial goals.

    Private trading strategy
    
        A private trading strategy is an investment approach that is not publicly disclosed and is only available to a select group of individuals or institutions. Unlike public trading strategies, which are widely available and marketed to the general public, private trading strategies are typically developed and used by professional traders, hedge funds, or other institutional investors.

        Private trading strategies may be based on proprietary algorithms, mathematical models, or unique market insights and are typically designed to provide an edge over more widely available public strategies. The use of private trading strategies can be a means for institutional investors to achieve higher returns and to gain an advantage over the general public in competitive financial markets.

    Historical market data
    
        Historical market data refers to past market information, including prices, volume, and other related metrics, for a specific security, asset class, or financial market. This data is used by traders, investors, and financial professionals to analyse market trends, evaluate investment opportunities, and make informed investment decisions.

        Historical market data can be collected and analysed over various time frames, including daily, weekly, monthly, or even yearly, and can cover different asset classes, including stocks, bonds, commodities, and currencies. This information is critical in providing insights into past market behaviour and can be used to identify patterns and trends, develop trading strategies, and make informed predictions about future market movements.

        Historical market data is widely available through a variety of sources, including financial data providers, stock exchanges, and government agencies.

        You can download :term:`decentralised finance` historical data using :term:`Trading Strategy client`.

        See also

        - :term:`OHLCV`

        - :term:`Dataset`

        - :term:`Trading strategy`

        - :term:`Backtest`

        - :term:`Trading Strategy client`

    Trend

        A trend is a general direction of change in a set of data or a market over time. In the financial markets, trends refer to the general direction of prices for a specific security, asset class, or market index. Trends can be either up, down, or sideways, and they can occur over various time frames, including short-term (such as minutes or hours), intermediate-term (such as days or weeks), or long-term (such as months or years).

        Trends are important in investment decision-making as they provide insights into market behavior and can indicate potential opportunities for buying or selling securities. Traders and investors often use :term:`technical analysis` to identify and track trends, using tools such as trendlines, :term:`moving averages <EMA>`, and momentum indicators.

        See also

        - :term:`Trend-following`

        - :term:`Technical indicator`

        - :term:`Trading strategy`

        - :term:`EMA`

    Trend-following

        Trend-following is a :term:`trading strategy` that follows a :term:`trend`.

        Trend-following is a trading strategy that seeks to profit from the directional movement of prices in financial markets. The strategy involves analyzing the historical price data of an asset to identify trends and then making trades in the direction of the trend.

        Trend-following traders typically use technical analysis tools and :term:`technical indicators <technical indicator>`, such as :term:`moving averages <EMA>`, trend lines, and momentum indicators, to identify trends and determine when to enter or exit trades. The goal is to buy an asset when the trend is bullish (i.e., prices are rising) and sell it when the trend is bearish (i.e., prices are falling).

        The key principle of trend-following is to let profits run and cut losses quickly. This means that trend-following traders will typically use stop loss orders or other risk management techniques to limit their potential losses if the trend reverses.

        Trend-following strategies can be applied to a wide range of financial instruments, including stocks, bonds, currencies, and commodities. The strategy is popular among both individual and institutional traders and has been used successfully by many well-known traders and hedge funds.

        One potential disadvantage of trend-following is that it can be subject to false signals and whipsaws, particularly in volatile or choppy markets. In addition, trend-following can be slow to react to sudden market shifts or changes in investor sentiment, which can result in missed opportunities or losses. As with any trading strategy, it's important to carefully consider the risks and benefits of trend-following and to use it in combination with other tools and techniques to manage risk and optimize performance.

        See also

        - :term:`Trend`

        - :term:`Technical indicator`

        - :term:`Trading strategy`

    Bollinger bands
    
        Bollinger Bands are a technical analysis indicator used to measure market volatility and identify potential buying or selling opportunities. The indicator consists of a set of three lines plotted on a price chart, with the middle line being a simple moving average of the security's price, and the upper and lower bands serving as a measure of volatility, typically set 2 standard deviations away from the moving average.

        In a market with low volatility, the Bollinger Bands will be closer together, while in a market with high volatility, the bands will be further apart. When prices move outside the upper band, it can be a sign that the security is overbought, and a potential selling opportunity, while a move below the lower band can indicate that the security is oversold and a potential buying opportunity.

        Bollinger Bands are widely used by traders and investors in making investment decisions, as well as in setting stop-loss orders and determining potential profit targets.

        See also

        - :term:`Technical indicator`

        - :term:`Trading strategy`

        - :term:`Trend`

    Relative strength index (RSI)

        The Relative Strength Index (RSI) is a popular momentum indicator used in technical analysis to measure the strength of a security's price action. It compares the magnitude of recent gains to recent losses, in order to determine overbought or oversold conditions, and potential buying or selling opportunities.

        The RSI is calculated as a ratio of average gains to average losses, and is represented as a value between 0 and 100. Values above 70 are considered overbought and may indicate a potential sell opportunity, while values below 30 are considered oversold and may indicate a potential buy opportunity. The RSI can be used for various time frames and for multiple securities, including individual stocks, bonds, commodities, and currencies.

    Fundamental analysis
    
        Fundamental analysis is a method used in finance and investing to evaluate the intrinsic value of a security or asset by examining its underlying economic and financial characteristics and performance. The goal of fundamental analysis is to assess the economic viability and financial health of a company, and to determine if the current market price of its securities reflects its true worth.

        In fundamental analysis, investors analyse a wide range of financial and economic data, including financial statements, industry trends, and macroeconomic indicators, to gain insight into a company's earnings potential, growth prospects, and risk factors. Key metrics analysed include revenue, earnings, profitability, and cash flow, as well as debt levels, management quality, and competitive position.

    Systematic trading

        Systematic trading is a method of trading financial markets that utilises mathematical models and algorithms to execute trades based on predefined rules and conditions. It aims to remove emotion and subjectivity from the investment process by relying on data-driven decision making.

        In systematic trading, trades are executed automatically based on the rules established in the trading system. These rules can be based on technical indicators, market data, or other signals, and are designed to identify and take advantage of market inefficiencies and price discrepancies. The models used in systematic trading are typically back-tested using historical market data to assess their viability and refine their parameters.

        Systematic trading is often used in quantitative finance and high-frequency trading, where trades are executed at a high rate and on a large scale. It can be applied to a wide range of financial instruments, including stocks, bonds, futures, options, and currencies.

    Custodial
    
        A custodial service in cryptocurrency refers to a third-party company or service that holds and manages the private keys associated with a user's cryptocurrency assets. The private keys are used to access and control the user's cryptocurrency holdings, so entrusting them to a custodial service offers increased security and convenience compared to holding them on an individual's own device or exchange.

        In a custodial setup, the user's cryptocurrency assets are stored on the custodian's servers and the user can access and manage their assets through the custodian's platform. This can be useful for individuals or institutions who are concerned about the security of their assets or who do not have the technical expertise to manage their own private keys.

        Custodial services typically offer a variety of features such as multi-signature authorization, offline storage, and insurance for the assets in their care. However, it is important to note that custodial services also come with some risks, as the user is relying on the security and reliability of the custodian to protect their assets. Additionally, users must trust the custodian to act in their best interests and to follow the appropriate procedures and regulations in the event of a security breach or other issue.

        As such, it is important for users to carefully consider the reputation and track record of a custodial service before entrusting their assets to them, and to ensure that they understand the risks and benefits associated with this type of service.

        See also :term:`non-custodial`.

    Token

        A token in blockchains and :term:`decentralised finance` represents an :term:`on-chain` asset.

        Tokens can be

        - Fungible tokens: assets like crytocurrencies, :term:`stablecoins <stablecoin>`

        - Non-fungible tokens (NFTS), like tokenised pictures and video game items

        :term:`ERC-20` is the most popular technical token standard.

        See also

        - :term:`Decentralised finance`

        - :term:`On-chain`

        - :term:`Wallet`

    Lending protocol

        A lending protocol is a :term:`decentralised finance` service for lending and borrowing :term:`tokens <token>`.

        Lending protocols are :term:`smart contract`-based :term:`non-custodial` protocols to
        lend and borrow your assets.

        Lending protocols enable :term:`shorting` of different :term:`lending pool` tokens.

        Popular lending protocols include :term:`Aave`, Compound and Euler.

        See also

        - :term:`Aave`

        - :term:`Lending pool`

        - :term:`Decentralised finance`

        - :term:`Decentralised exchange`

        - :term:`Token`

        - :term:`On-chain`

        - :term:`Smart contract`


    Lending pool

        In :term:`decentralised finance`, a lending pool is a pool of a single asset in a :term:`lending protocol`.

        Sometimes a lending pool is also called *reserve* (:`term`Aave`).

        The assets are typically held in a pool and are lent out to borrowers, who can use them for a variety of purposes such as margin trading, liquidity provision, or to meet other financial obligations.

        Lending pools typically offer a high yield investment opportunity for lenders, as they can earn interest on their cryptocurrency assets without having to sell them. Borrowers, on the other hand, can access the assets they need to meet their financial obligations, without having to sell their own assets or go through the traditional lending process.

        Lending pools are typically run on decentralised finance (DeFi) platforms, which use blockchain technology to create a decentralised, trustless financial system. This means that the platform operates on open-source software and operates transparently and immutably, allowing for secure and transparent transactions.

        See also

        - :term:`Lending protocol`

        - :term:`Shorting`

        - :term:`Stablecoin`

        - :term:`Decentralised finance`

        - :term:`Decentralised exchange`

    Cumulative return

        Cumulative return is the total change in the investment price over a set time, taking into account reinvested dividends or capital gains.
        It allows for investors to measure the performance of an investment over a certain period of time.
        It is is distinct from annualized return which measures the rate of return over a given period of time.

        Cumulative return is calculated by taking the gain (or loss) of the investment over a certain time period and dividing it by the principal value of that investment.
        It can also be calculated using the standard returns of each period, where Rc = (1 + R1)(1 + R2) - 1.

    Aggregate return

        Aggregate returns in portfolio refer to the percentage difference from period to period of the value of a portfolio.

        It is calculated by taking the change in the value of the portfolio and expressing it as a percentage of the original invested amount.
        This generates a time series of interim net asset values.

    Blockchain snapshot

        A chain snapshot is a dump of the chain state.
        By downloading the snapsnot a new blockchain node can sync faster
        to the chain tip, instead of downloading each block and verifying
        each transaction individually from the peer-to-peer network.

        The snapshot may be

        * Chain built-in sync mechanism: `Ethereum Snapshot Protocol (SNAP) <https://github.com/ethereum/devp2p/blob/master/caps/snap.md>`__

        * `Erigon BitTorrent snapshots - Erigon uses internal BitTorrent client to download https://github.com/ledgerwatch/erigon-snapshot <https://github.com/ethereum/devp2p/blob/master/caps/snap.md>`__

        * Manually hosted snapshot: `Polygon manually hosted snapshot downloads <https://snapshots.polygon.technology/>`__

        Different snapshots offer different security guarantees. For example, when downloading
        a snapshot from a Polygon manually hosted snapshot repository, you trust that the admins of this repository
        have not modified the current historical blockchain state. The built-in Ethereum Snapshot Protocol
        verifies from the peer-to-peer network that the snap state is correct.

        How much snapshot speeds up the node sync depends on what kind of node you want to run:
        full node without event history, a full node with event history or archive node.
        For example, even with a snapshot syncing a BNB Chain full node with event history
        will take several weeks, because Erigon needs to construct the historical events
        from the raw blocks after the download, as historical events are not precomputed in the
        snapshot.

        `Read the blog post about snapshots <https://tradingstrategy.ai/blog/bnb-chain-erigon-snapshot>`__.

    zstd

        The `Zstd <https://www.mankier.com/1/zstd>`__ compression is a modern compression algorithm developed by Facebook. It tries
        to strike a good balance with speed/compression ratio for modern multithreaded
        CPUs.

        `zstd` is also the command line utility that can be used to compress/decompress
        files in a terminal. It can be combined with `tar` to create archives
        of directories, like :term:`blockchain snaphots <blockchain snapshot>`.

    Erigon

        The `Erigon <https://github.com/ledgerwatch/erigon>`__ node is an implementation of Ethereum written in Go, designed to run archive nodes that manage large amounts of on-chain data.
        It is a decentralized blockchain node provider that provides a secure, private, and scalable blockchain infrastructure.
        If you want to host your own JSON-RPC API access to raw EVM blockchain data,
        Erigon is a good option.

        Erigon is one of the two most popular Ethereum clients, alongside GoEthereum.
        The benefits of Erigon over GoEthereum include better disk space usage
        and performance due to more advanced database structures. Internally Erigon uses Lightning Memory-Mapped Database Manager (LMDB).

        Erigon supports some alternative blockchains to Ethereum mainnet,
        like Polygon and BNB Chain. Erigon is not available for all EVM-compatible networks, as the project was started many years after GoEthereum, which had become the de facto standard EVM implementation at that point.

    Storj

        The `Storj <https://www.storj.io/>`__ protocol is a decentralized cloud storage platform that allows users to rent out unused hard drive space for digital file storage.
        It offers zero-trust security and can be used for large file storage, streaming and backups.
        Storj runs on its own blockchain model, but for the interaction the user does not need to know about
        the blockchain at all.

        Due to its decentralised mode, Storj storage and egress costs are very competitive compared
        to centralised cloud offerings such as from Amazon, Microsoft or Google.

        Storj has an :term:`ERC-20` token called `STORJ <https://tradingstrategy.ai/trading-view/ethereum/tokens/0xb64ef51c888972c908cfacf59b47c1afbc0ab8ac>`__.

        See also

        - :term:`Decentralised finance`

        - :term:`Token`

    ERC-20

        ERC-20 is the original token standard for Ethereum.

        ERC-20 is a technical standard used to issue and implement tokens on the Ethereum blockchain.
        It was proposed in November 2015 by Ethereum developer Fabian Vogelsteller and defines a common set of rules such as how the tokens can be transferred, how transactions are approved, and the total supply of tokens. ERC-20 tokens are the most commonly used tokens on the Ethereum network and are designed to be used for paying for functions.

        ERC-20 token standard has several limitations and architectural shortcomings.
        Its `approve()` and `permit()` based functions, originally planned for having
        better smart contract security in Solidity, have proven to be an attractive
        vector for scams as normal users do not understand they are transferring tokens
        when calling these methods from their wallets.

        The token standard has been adopted by other EVM-based blockchains like
        BNB Chain, Polygon, Avalanche C-Chain and Fantom.

        See also

        - :term:`Smart contract`

        - :term:`Decentralised exchange`

        - :term:`Wallet`

        - :term:`Token`

        - :term:`EVM-Compatible`

    EVM-compatible

        EVM compatible means that a blockchain uses the same EVM architecture
        as the original Ethereum mainnet and is its clone.

        EVM compatible blockchains can use the existing smart contracts
        like :term:`ERC-20` unmodified. They can also blockchain explorers,
        wallets and such with little modifications. This has lead to
        born to Ethereum clone chains like Polygon, :term:`Avalanche` C-Chain and
        :term:`BNB Chain`.

        See also

        - :term:`Wallet`

        - :term:`ERC-20`

        - :term:`Erigon`

        - :term:`BNB Chain`

        - :term:`Avalanche`

    Reserve currency

        In the :term:`trading strategy` terminology, a reserve currency
        refers to the base currency of the strategy to which profits
        are withdrawn.

        A common reserve currency for :term:`decentralised finance` strategies
        is :term:`USDC` :term:`stablecoin`.

    Curl

        cURL (Client URL) is a command-line tool that enables data exchange between a device and a server through a terminal.
        It provides a library (libcurl) and command-line tool (curl) for transferring data using various network protocols.
        cURL commands allow users to transfer data without user interaction using supported libcurl libraries[5]

        `Read more at Curl website <https://curl.se/>`__.

    Swap

        In :term:`AMM`-based decentralised exchanges trades called called swaps.

        In a swap you you trade against :term:`liquidity providers <liquidity provider>`
        with market order like trades.

        The user interacts with a :term:`liquidity pool` using :their term:`non-custodial` :term:`wallet`
        to perform a swap.

        Some example swaps:

        - In a buy swap, you bought cryptocurrency token with a stable coin,
          e.g. you buy AVAX with :term:`USDC` :term:`stablecoin`

        - In a buy sell, you bought cryptocurrency token with a stable coin,
          e.g. you sell AVAXs to gain USDC in your :term:`wallet`

        Swaps are used on `AMMs <AMM>`.

        See also

        - :term:`Swap fee`

        - :term:`Liquidity provider`

        - :term:`Liquidity pool`

        - :term:`AMM`

    Swap fee

        Swap fee is the part cost of a trade on :term:`AMM` markets.

        In :term:`AMM`-based decentralised exchanges trades called called :term:`swaps <swap>`.

        Swap fee includes

        - :term:`liquidity provider` reward, usually 0.05% - 0.30%

        - :term:`protocol fee`, usually 0.00% - 0.05%

        Swap fees usually exclude

        - :term:`price impact`

        - :term:`slippage`

        See also

        - :term:`Swap`

        - :term:`AMM`

        - :term:`Liquidity provider`

        - :term:`XY Liquidity Model`

        - :term:`Bonding curve`

    Protocol fee

        In :term:`AMM`-based decentralised exchanges a protocol fee is the fee
        taken from your trading costs that goes towards the protocol treasury.

        Protocol fee is revenue for the protocol itself.

        The distribution of the protocol fee is decided by a DAO.

        Usually protocol fee is 0.00% (Uniswap v3 default) - 0.005% (PancakeSwap, Sushi).

        See also

        - :term:`Swap fee`

        - :term:`Decentralised exchange`

    Wallet

        In a blockchain, a wallet refers to an application that offers interaction
        to your :term:`non-custodial` blockchain account.

        Users interact with different :term:`web3` and :term:`decentralised finance` protocols
        using their wallets.

        Popular wallets include

        - MetaMask (a web browser extension)

        - Avalanche Core (a web browser extension)

        - TrustWallet (a mobile application)

        - Ledger (a hardware wallet)

        Different services and wallets may interoperate using :term:`WalletConnect` protocol.

        See also

        - :term:`Web3`

        - :term:`Non-custodial`

        - :term:`Decentralised exchange`

        - :term:`ERC-20`

        - :term:`On-chain`

        - :term:`WalletConnect`

    Liquidity provider

        Liquidity providers (LPs) are users that deposit their assets to the :term:`liquidity pools <liquidity pool>` of an Automated Market Maker (:term:`AMM`).

        Liquidity providers are crowdsourced collections of crypto assets used by the AMM to trade with people buying or selling one of these assets.
        AMMs use pre-programmed mathematical equations to adjust prices based on supply in order to make sure the ratio of assets in any liquidity pool is maintained.

        See also

        - :term:`AMM`

        - :term:`Swap fee`

        - :term:`Liquidity pool`

    Liquidity pool

        Liquidity pool is the available trading liquidity of a single :term:`trading pair` in :term:`AMM`.

        In a liquidity pool, :term:`liquidity providers <liquidity provider>` pool together one of more tokens
        that users can trade against. For providing liquidity, the providers are rewarded in :term:`swap fees <swap fee>`.

        Liquidity pools are often their own smart contracts that can be easily explored and tracked in a blockchain explorer.

        See also

        - :term:`Liquidity`

        - :term:`Trading pair`

        - :term:`Swap fee`

        - :term:`AMM`

    Trading pair

        In :term:`decentralised finance`, trading pair represents a market for a two or more tokens.

        An example trading pair can be `BNB/BUSD trading pair on PancakeSwap <https://tradingstrategy.ai/trading-view/binance/pancakeswap-v2/bnb-busd>__`.

        Trading pairs are named as a "ticker" based on their :term:`base token` and :term:`quote token` symbols.

        Sometimes trading pairs are also called pools, because they are :term:`liquidity pool` mechanism
        based.

        Unlike in traditional finance, in :term:`decentralised finance` a trading pair can also consists
        of three or more assets. This is especially popular in :term:`stablecoin` markets.

        Trading pairs can be

        - :term:`Order book` based

        - :term:`Liquidity pool` based

        See also

        - :term:`Decentralised exchange`

        - :term:`Lending pool`

        - :term:`Liquidity pool`

        - :term:`AMM`

        - :term:`base token`

        - :term:`quote token`

    Best trading algorithm

        The best trading algorithm in the world is one that makes most profit.

        Depending on the the market situation and available :term:`trading pairs <trading pair>`,
        the best trading algorithm can vary day by day, or depending whether the markets are in
        :term:`bull market` or :term:`bear market`.

        See :term:`trading strategy` term
        to get an overall summary of different available trading algorithms.

        A trading algoritmn can generally yield 5% - 300% yearly profit depending on the
        amount of deployed capital and the market size. The goal is to beat :term:`risk-free rate`.

        The usual ways to rank :term:`trading algorithms <trading algorithm>` include

        - :term:`Cumulative profit`

        - :term:`Risk-adjusted return`

        See also

        - :term:`Trading strategy`

        - :term:`Trading algorithm`

        - :term:`Algorithmic trading`

        - :term:`Quantitative analysis`

    Risk-adjusted return

        Risk-adjusted return is a calculation of the return (or potential return) on an investment such as a stock or corporate bond when compared to the amount of risk the investment has represented throughout a given period of time.

        It is measured by taking into account the risk associated with an investment and comparing it to its return.
        The risk can be measured e.g. as a :term:`maximum drawdown`.

        See also

        - :term:`Risk-free rate`

        - :term:`Best trading algorithm`

        - :term:`Cumulative profit`

        - :term:`Equity curve`

        - :term:`Drawdown`

        - :term:`Maximum drawdown`

    Cumulative profit

        Cumulative profit tells the overall profit of :term:`trading strategy` over a time.

        Cumulative profit is the excess of net income and gains over net losses, determined on a cumulative basis from the inception of an investment fund through to its termination date.
        It includes realized trading P&L, positions open P&L, and other total profits or losses generated since the :term:`trading strategy`'s inception.

        To calculate cumulative profit, one must add together all net profit numbers over a specific time frame.

        See also

        - :term:`Trading strategy`

        - :term:`Equity curve`

        - :term:`Risk-adjusted return`

        - :term:`Best trading algorithm`

    Equity curve

        An equity curve is a graphical representation of the change in the value of a trading account over a time period.

        Equity curves are used by traders to determine the viability of their :term:`trading strategies <trading strategy>`.
        A good equity curve has an even slope, small and short-lived :term:`drawdowns <drawdown>`, and a good amount of trades to make the observation statistically significant.

        Equity curve trading is a methodology where a trading strategy is turned on and off based on the performance of an equity curve, which is a plot showing the growth of capital over time from one specific :term:`trading strategy` or portfolio.

        See also

        - :term:`Trading strategy`

        - :term:`Risk-adjusted return`

        - :term:`Cumulative profit`

        - :term:`Drawdown`

    Auto-compounding

        Auto-compounding is an investment strategy in which the user's investment yields are automatically reinvested into the investment principal at regular intervals.

        Compounding is a powerful investing concept that involves earning returns on both the original investment and on returns received previously.
        It is considered one of the smartest investment strategies, as it can generate additional earnings over time.

        See also

        - :term:`Trading strategy`

        - :term:`Risk-adjusted return`

        - :term:`Cumulative profit`

        - :term:`Drawdown`

    BNB Chain

        BNB Chain is an :term:`EVM-Compatible` blockchain from the Binance cryptocurrency exchange.

        BNB Chain is a direct :term:`fork` of Ethereum.

        BNB Chain offers good interaction with the Binance cryptocurrency exchange (:term:`CEX`), making it attractive
        for the users of this exchange. As of the writing of this, Binance has a 70% market
        share of the cryptocurrency trading volume, making it very dominant in the blockchain industry.

        BNB Chain is based on centralised, proof-of-authority. model.
        `BNB Chain was recently halted in a hack <https://cointelegraph.com/news/bnb-chain-confirms-bsc-halt-due-to-potential-exploit>`__.
        It uses `BNB token <https://tradingstrategy.ai/trading-view/binance/tokens/0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c>`__
        as its :term:`native token`.

        The dominating :term:`decentralised exchange` on BNB Chain is `PancakeSwap <https://tradingstrategy.ai/trading-view/binance/pancakeswap-v2>`__.

        See also

        - :term:`EVM-compatible`

        - :term:`Fork`

        - :term:`CEX`

        - :term:`Native token`

    Airdrop

        In :term:`decentralised finance`, airdop is a method to :term:`distritube tokens <token distribution>`
        for the project users for free.

        The goals of an airdrop include making the protocol more decentralised and rewarding the users.
        The airdrop involves sending :term:`tokens <token>` or making them claimable to the users
        through a Merkle tree method.

        Historically famous airdrops include :term:`Uniswap`, Optimism and Juno.

        :term:`Liquidity mining` is somewhat similar mechnanism to airdrop.

        See also

        - :term:`Decentralised finance`

        - :term:`Token`

        - :term:`Token distribution`

        - :term:`Liquidity mining`


    Token distribution

        In :term:`decentralised finance`, a token distribution refers to how the project :term:`tokens <token>`
        have been divided between different stakeholders.

        More decentralised token distribution is usually good for price action and robustness of the project;
        there are less large entities that can dominate the DAO governance discussion or be a single point of a failure.
        Decentralisation and better token distribution lessen the likelihood of severe :term:`price impact` events.

        Token distribution methods include

        - Initial coin offering (ICO)

        - Initial :term:`DEX <decentralised exchange>` offering (IDO)

        - Initial token offering (ITO)

        - Direct market listing

        - Public sale

        - Private sale

        - Simple Agreement for Future Tokens (SAFT)

        - :term:`Airdrop`

        - :term:`Liquidity mining`

        - :term:`Yield farming`

        - Proof-of-work (Bitcoin, Chia, others)

        See also

        - :term:`Decentralised finance`

        - :term:`Decentralised exchange`

        - :term:`Token`

    Aave

        In :term:`decentralised finance`, Aave is one of the largest decentralised :term:`lending protocols <lending protocol>`.

        Aave was started in 2017 under EthLend name. Aave means a ghost in the Finnish language.
        The latest version, Aave v3, was launched in 2023.
        Aave has an :term:`ERC-20` token `AAVE <https://tradingstrategy.ai/trading-view/ethereum/tokens/0x7fc66500c84a76ad7e9c93437bfc5ac33e2ddae9>`__.

        As the writing of this, Aave has been deployed several blockchains, including Ethereum,
        Polygon, Arbitrum and Optimism.

        Aave has a protocol subset for :term:`real-world assets (RWAs) <RWA>` called Aave Arc.

        See also

        - :term:`Decentralised finance`

        - :term:`Lending protocol`

        - :term:`Token`

        - :term:`RWA`


    Sushi

        In :term:`decentralised finance`, Sushi, also
        known as SushiSwap, is one of the largest :term:`AMM` :term:`decentralised exchanges <decentralised exchange>`.

        Sushi started as a :term:`fork` of :term:`Uniswap`. The later Sushi versions added support for
        :term:`CLMM` :term:`liquidity` models and many other trading features.

        Sushi is launched on many blockchains, including Ethereum mainnet, Polygon, Avalanche and
        :term:`BNB Chain`. `View Sushi on Ethereum mainnet <https://tradingstrategy.ai/trading-view/ethereum/sushi>`__.

        See also

        - :term:`Uniswap`

        - :term:`Fork`

        - :term:`Decentralised exchange`

        - :term:`AMM`

        - :term:`CLMM`

    GM

        In :term:`decentralised finance` and :term:`web3`, GM is a meme of saying "good morning".

        It is a polite greeting people use to notify they have arrived online. Despite what the name says,
        it can be used at any time of a day.

        The meme is very popular. For example, Warpcast client for Farcast Web3 protocol has a built-in "GM" button.

        See also

        - :term:`Web3`

        - :term:`Decentralised finance`

    Web3

        Web3 is a social and technical movement to decentralised social media and online communities.

        Web 2.0 led to the concentration of power to few Silicon Valley based social media conglomerates,
        like Facebook and Twitter. Many creators, users and governments are dissatisfied these companies,
        as they see them executing profit sharing and censorship powers unfairly.

        Web3 movement aims to address this issue with user owned content.
        The content is usually digital content and can be pictures, posts, social media profiles or video game assets.

        The content is not siloed,
        truly owned by the user, and can be transferred across different services and protocols.
        The profit share is made more fair the users, not the corporation owners, have more negotiation power.
        This is achieved using open source, blockchains,
        open protocols, public key cryptography and :term:`token` based governance.

        Web3 protocols are funded using :term:`decentralised finance` instead of private venture capital.
        Web3 protocols aim to fair :term:`token distribution` so that users would own the largest
        share of protocol control and revenues.

        Popular Web3 protocols and projects include e.g.

        - Lens protocol (social media)

        - Farcast (social media)

        - `Paradise Tycoon <https://paradisetycoon.com/>`__ (mobile game with NFTs)

        - `Phaver <https://phaver.com/>`__ (Reddit for Web3)

        - `Sandbox <https://www.sandbox.game/en/>`__ (metaverse game)

        Web3 has also other meanings

        - Historically, the technical term `web3 referred to the three original decentralised technologies that were visioned when Ethereum launched <https://twitter.com/moo9000/status/1484463908152881152>`__:
          Ethereum, shh, and bzz.

        - Web3 foundation is the name of the Swiss non-profit that launched Polkadot blockchain.

        See also

        - :term:`Decentralised finance`

        - :term:`Token`

        - :term:`NFT`

        - :term:`Token distribution`

        - :term:`Wallet`

    NFT

        In :term:`web3`, NFT stands for non-fungible tokens.

        NFTs are :term:`tokens <token>` that unique and thus have value, like artistic value
        or in-game benefits. Usually NFTs represent digital content, but can also represent
        :term:`real-world assets <RWA>`.

        Like with all other :term:`decentralised finance` protocols, NFTs are :term:`non-custodial`
        and do not need an intermediates like banks to track and change their ownership.

        See also

        - :term:`Web3`

        - :term:`Token`

        - :term:`Non-custodial`

        - :term:`Wallet`

    RWA

        In :term:`decentralised finance`, RWA stands for Real World Asset.

        Unlike cryptocurrencies and pure digital assets, like art :term:`NFTs <NFT>`,
        real-world assets have a real-world ownership representation.

        RWAs can be

        - :term:`Stablecoins <stablecoin>`

        - Real-estate

        - Bonds

        - Stock

        - Land

        - Forest

        - Energy

        - Carbon certificates

        RWAs can trade on :term:`lending protocols <lending protocol>` and :term:`decentralised exchanges <decentralised exchange>`.
        RWAs need special :term:`oracles <oracle>` to bring information about the real-world asset data to :term:`on-chain`.

        As the writing of this, most popular RWA classes are stablecoins and bonds.

        For RWA case studies, see

        - `Circle's and Uniswaps report on stablecoin usage in remittance and cross-border payments <https://www.circle.com/blog/on-chain-foreign-exchange-and-cross-border-payments>`__

        - `Siemens launching $60M bond on a public blockchain <https://www.ledgerinsights.com/siemens-digital-bond-blockchain/>`__

        See also

        - :term:`Decentralised finance`

        - :term:`Stablecoin`

        - :term:`Lending protocol`

        - :term:`Decentralised exchange`

        - :term:`Aave`

        - :term:`Oracle`

    WalletConnect

        In :term:`Web3`, WalletConnect is a protocol to allow users to use various kind of wallets with different services.

        WalletConnect is an abstraction layer that supports connecting different :term:`wallet <wallet>` to
        a :term:`web3` and :term:`decentralised finance` protocols. It supports both :term:`non-custodial`
        and :term:`custodial` wallets.

        Wallet types may include

        - Mobile app based wallets

        - Desktop app based wallets

        - Website based wallets

        - Hardware wallets

        - Multisignature wallets

        - Professional :term:`custodial wallets <custodial>` like MetaMask Institutional, Fireblock, Q-redo

        WalletConnect is supported across multiple blockchains, including e.g. :term:`EVM-Compatible` ones,
        NEAR, Chia and Solana.

        See also

        - :term:`Wallet`

        - :term:`Non-custodial`

        - :term:`Custodial`

    Trading Strategy client

        Trading Strategy client is a :term:`Python` library to access the :term:`historical market data`
        on Trading Strategy protocol oracles.

        The data includes

        - :term:`Decentralised exchanges <decentralised exchange>` market data in :term:`candle` and
          :term:`OHLCV` format

        - :term:`Lending protocols <lending protocol>`

        You can then examine the data in :term:`Jupyter notebook`.

        `See the project Github README <https://github.com/tradingstrategy-ai/trading-strategy/>`__.

        See also

        - :term:`Trading Strategy Framework`

        - :term:`Trading strategy Protocol`

        - :term:`Backtest`

        - :term:`OHLCV`

    Trading Strategy Protocol

        The Trading Strategy Protocol is a :term:`decentralised finance` protocol build using :term:`oracles <oracle>`
        and :term:`Trading Strategy Framework`.

        It allows :term:`quant developers <quant>` to deploy :term:`automated trading strategies <automated trading strategy>`
        that trade on :term:`decentralised exchange <decentralised exchange>` and :term:`lending protocols <lending protocol>`.

        See also

        - :term:`Trading strategy`

        - :term:`Backtest`

        - :term:`Trading Strategy Client`

        - :term:`Trading Strategy Framework`

    Trading Strategy Framework

        The Trading Strategy Framework is a :term:`Python` based software development library
        to develop :term:`automated trading strategies <automated trading strategy>` for :term:`decentralised finance`
        markets.

        The framework consists of

        - Market data feed reader in the form of :term:`Trading Strategy Client`

        - :term:`Backtesting framework <backtest>`

        - Live trading execution environment

        The core audience of the library is :term:`quants <quant>`.

        See also

        - :term:`Trading strategy`

        - :term:`Decentralised finance`

        - :term:`Backtest`

        - :term:`Trading Strategy Client`

        - :term:`Trading Strategy Protocol`

    Oracle

        In :term:`decentralised finance`,
        oracle allows :term:`smart contracts <smart contract>` to access external data.

        An oracle in a blockchain is an entity that connects blockchains to external systems,
        allowing smart contracts to execute based upon inputs and outputs from the real world.

        Oracles are third-party services that provide smart contracts with external information,
        while blockchain technology itself is defined as a ledger of decentralized data that is securely
        shared by select participants.

        The most common use case for oracle is to tell the :term:`fair value` of an asset.
        This can be a :term:`token` or a :term:`real-world asset <RWA>`.

        Oracles are security critical system, as they often report prices and if the price is wrong
        the underlying protocol may suffer what is called an oracle attack or a price manipulation attack.
        For example, if in a :term:`lending protocol` the collateral price is wrong,
        the loands can be incorrectly liquidated.

        Popular oracles protocols include

        - ChainLink (on :term:`EVM-Compatible` blockchains)

        - Python (Solana)

        See also

        - :term:`Smart contract`

        - :term:`Fair value`

        - :term:`RWA`

        - :term:`Decentralised finance`

    HyperSDK

        HyperSDK is an optimised software development kit to build blockchains from :term:`Avalanche`.

        HyperSDK is MerkleDB and has very optimised state sync. The high performance
        makes HyperSDK optimal for building trading focused :term:`app chains <app chain>`. Theoretical
        transaction throughput can be up to 50 transactions per second (TPS). Internally HyperSDK nodes
        uses `Pebble database <https://github.com/cockroachdb/pebble#advantages>`__.

        `See HyperSDK on Github <https://github.com/ava-labs/hypersdk>`__.

        See also

        - :term:`Avalanche`

        - :term:`HyperSDK`

        - :term:`App Chain`

        - :term:`Web3`

    IndexVM

        IndexVM is a blockchain virtual machine built on the top of :term:`HyperSDK`
        dedicated to increasing the usefulness of the world's content-addressable data by enabling anyone to index it.

        `See IndexVM on Github <https://github.com/ava-labs/indexvm>`__.

        See also

        - :term:`App Chain`

        - :term:`Avalanche`

        - :term:`Web3`

        - :term:`HyperSDK`

    Avalanche

        Avalanche is a blockchain based on Avalanche consensus protocol.

        Avalanche supports subnets, where each subnet is partially independent blockchain
        having its own properties. Some subnets, like Avalanche C-Chain are :term:`EVM-Compatible`.
        Some subnets, can be more optimised. Subnets can be also :term:`app chains <app chain>`.

        The :term:`native token` of Avalanche is `AVAX <https://tradingstrategy.ai/trading-view/avalanche/tokens/0xb31f66aa3c1e785363f0875a1b74e27b85fd66c7>`__.
        The most popular :term:`decentralised exchange` on Avalanche is `Trader Joe <https://tradingstrategy.ai/trading-view/avalanche/trader-joe>`__.

        Popular subnets include

        - Avalanche C-Chain, generic :term:`EVM-Compatible` chain

        - Dexalot - :term:`EVM-Compatible` :term:`decentralised exchange` chain

        - Swimmer Network - the :term:`app chain` for Crabada idle-game

        See also

        - :term:`Web3`

        - :term:`EVM-Compatible`

        - :term:`HyperSDK`

        - :term:`App Chain`

        - :term:`IndexVM`

    App Chain

        An App Chain, also known as an application-specific blockchain, is a blockchain that is exclusively designed to operate one specific application.

        App Chain eliminates competition for resources away from everyone else using the chain, allowing for greater scalability and flexibility

        Popular app chains include

        - DyDx decentralised futures exchange

        - Vega Protocol exchange

        - Stargaze :term:`NFT` chain on Cosmos

         - Swimmer Network - the app chain for Crabada idle-game

        See also

        - :term:`Web3`

        - :term:`Decentralised finance`

        - :term:`NFT`

        - :term:`Avalanche`

        - :term:`HyperSDK`

    Spot market

        A spot market is a market where actual assets are traded as the opposite of interest to the assets.

        - In cryptocurrency markets, spot market is where you receive actual tokens for your purchases.

        - In stock markets, you will receive stock certificate

        - In commodities markets (oil, wheat, etc.), you will receive a physically delivered item

        Spot market itself does not have :term:`shorting`, or :term:`leverage`.

        See also

        - :term:`Decentralised finance`

        - :term:`Shorting`

        - :term:`Longing`

        - :term:`Leverage`

    Leverage

        Leverage in trading is the use of borrowed funds to increase one's trading position beyond what would be available from their cash balance alone.

        Leverage trading is also known as margin trading.

        It enables traders to open a position worth much more than the money they deposit.

        Leverage can be used in :term:`longing` or :term:`shorting`.

        - In a long, 2x leverage means that you can make 2x profit when the price moves up 1x

        - In a short, 1x leverage means that you can make 1x profit when the price moves up 1x

        - If the price moves too much your deposited money is :term:`liquidated <liquidation>`

        - Shorting always involves borrowing

        - In leveraged markets often longs pay shorts, short pays longs as a zero-sum trading game

        Leverage requires collateral. If the leveraged trade goes belly up, the account
        doing the leveraged trade may be :term:`liquidated <liquidation>`.

        See also

        - :term:`Decentralised finance`

        - :term:`Shorting`

        - :term:`Longing`

        - :term:`Lending protocol`

        - :term:`Liquidation`

    Margin trading

        Leverage trading is also known as margin trading.

        See :term:`leverage`.

    Liquidation

        In trading, liquidation happens when a trader has insufficient funds to keep a leveraged trade open.

        The exchange or term:`lending protocol` closes the position.

        - Any collateral that was used to open the position is sold ("liquidated")

        - The proceedings of collateral liquidation is used to paid the trades who took the opposite
          side of the trade

        In :term:`decentralised finance`, liquidation also happens on :term:`lending protocols <lending protocol>`.

        See also

        - :term:`Decentralised finance`

        - :term:`Shorting`

        - :term:`Longing`

        - :term:`Leverage`

    Portfolio construction

        Portfolio construction a :term:`trading strategy method <trading strategy>` of selecting securities optimally to achieve maximum returns while taking minimum risk.

        Portfolio constructions involves understanding how different asset classes, funds, and weightings impact each other and an investor's objectives

        Portfolio construction has several phases

        - **Asset allocation models** - to determine the optimal mix of asset classes (stocks, bonds, and commodities) in a portfolio, based on historical returns, volatility, and correlations.

        - **Optimization techniques** - to identify the best combination of individual securities within each asset class, based on factors such as expected return, risk, and liquidity.

        - **Risk management tools** - such as :term:`stop-loss orders <stop loss>`, hedging strategies, and diversification techniques, to manage portfolio risk and reduce exposure to individual assets or market risks

        - :term:`Alpha generation strategies <alpha model>` - such as :term:`factor investing`, :term:`statistical arbitrage`, and :term:`trend-following`, to identify assets that are likely to outperform or underperform the broader market.

        See also

        - :term:`Alpha model`

        - :term:`Trading strategy`

        - :term:`Technical analysis`

        - :term:`Algorithmic trading`

    Alpha model

        An alpha model is a mathematical or quantitative framework used to generate trading signals that can be used in :term:`portfolio construction`.

        The alpha model seeks to identify assets that are likely to outperform or underperform their peers, based on a variety of factors and variables.

        Alpha models can be constructed using a variety of techniques, such as statistical analysis, machine learning algorithms, or financial modeling. The inputs to an alpha model may include company financial statements, price and volume data, macroeconomic indicators, and other market data.

        Once an alpha model generates :term:`trading signals <trading signal>`, the portfolio manager can use those signals to construct a portfolio that aims to generate alpha (i.e., excess returns) relative to a benchmark index. The portfolio manager may use other tools, such as risk management techniques or diversification strategies, to manage portfolio risk and optimize performance.

        It is important to note that alpha models are not foolproof and can be subject to various biases and errors. As such, portfolio managers must continually test and refine their alpha models to ensure that they are producing accurate and robust trading signals.

        See also

        - :term:`Portfolio construction`

        - :term:`Alpha signal`

        - :term:`Technical analysis`

        - :term:`Rebalance`

        - :term:`Alpha generation platform`

        - :term:`Decentralised finance`

    Alpha signal

        In :term:`portfolio construction`, an alpha signal refers to a metric or indicator used to identify investments that are likely to outperform the broader market. Alpha signals can be derived from a variety of sources, including fundamental analysis, technical analysis, and quantitative models.

        The goal of using an alpha signal is to identify securities that are undervalued or overvalued compared to their peers, and to use that information to construct a portfolio that generates excess returns (i.e., alpha) relative to a benchmark index.

        Examples of alpha signals include measures of company profitability, earnings growth, price momentum, and valuation ratios. A portfolio manager may use one or more alpha signals to construct a portfolio that is expected to outperform the benchmark index.

        See also

        - :term:`Portfolio construction`

        - :term:`Alpha model`

        - :term:`Decentralised finance`

    Trading signal

        A signal that predicts the future price movement.

        For the full description, see :term:`alpha signal`.

    Stop loss

        Stop loss is a risk management tool used by investors and traders to limit their potential losses on a trade.

        Stop loss can be implemented by

        - Having a special order type on :term:`order book`

        - Manually, by using :term:`market orders <market order>`

        A stop loss order is an instruction to automatically sell a security or other asset when its price falls to a certain level, known as the stop price.

        For example, if an investor buys a stock at $50 per share and sets a stop loss order at $45 per share, the stop loss order will be triggered if the stock falls to $45 or below. At that point, the stop loss order will automatically sell the stock, limiting the investor's potential loss to $5 per share.

        Stop loss triggers can be particularly useful in volatile markets or when trading more speculative assets with higher levels of risk. By setting a stop loss order, traders can limit their :term:`exposure` and losses in the event that the market moves against them, while still allowing for potential gains if the trade is successful.

        It's important to note that stop loss orders are not foolproof and can be subject to market fluctuations and gaps in trading. In addition, stop loss orders can be triggered during periods of high volatility or sharp price movements, resulting in a sale at a price below the stop price. As with any investment strategy, it's important to carefully consider the risks and benefits of using stop loss orders and to use them in combination with other risk management tools and techniques.

        See also

        - :term:`Order book`

        - :term:`Decentralised exchange`

        - :term:`Exposure`

    Statistical arbitrage

        Statistical arbitrage is a :term:`high-frequency trading` :term:`trading strategy` that uses statistical and quantitative techniques to identify and exploit pricing inefficiencies in financial markets.

        The strategy involves taking :term:`long <longing>` and :term:`short positions <shorting>` in pairs of securities that are believed to be mispriced relative to each other.

        The basic idea behind statistical arbitrage is to identify pairs of securities that are highly correlated in terms of their price movements. If the prices of these securities diverge from their historical correlation, a statistical arbitrageur will take a long position in the underpriced security and a short position in the overpriced security, in the hope of profiting from the convergence of prices.

        Statistical arbitrage strategies typically involve a high level of automation, using computer algorithms and mathematical models to analyze large amounts of data and make trades in real time. These algorithms may use a variety of statistical and mathematical techniques, such as regression analysis, machine learning, and time series analysis, to identify and exploit pricing inefficiencies.

        One advantage of statistical arbitrage is that it can be used in a variety of market conditions, including both up and down markets. However, the strategy can be complex and may require significant computational resources and expertise to implement effectively. In addition, as with any investment strategy, there is always the risk of losses due to unforeseen market events or unexpected changes in correlations between securities.

        See also

        - :term:`High-frequency trading`

        - :term:`Decentralised finance`

        - :term:`MEV`

    Market order

        A market order is a trade where a trader order is instantly fulfilled whatever is the availability liquidity and price
        at the markets.

        Specifically

        - Market orders remove liquidity (also known as a market taker)

        - Market buys move price up, market sells move price ddown

        The opposite of a market order is often a limit order. On :term:`AMMs <AMM>` the opposite is
        :term:`liquidity provider` position.

        On :term:`AMM` decentralised exchanges every :term:`swap` is a similar to a market order.

        Market orders, as a market taker, typically have higher fees than market makers (provides liquidity),
        as liquidity is the key selling point for any exchange.

        See also

        - :term:`Order book`

        - :term:`AMM`

        - :term:`Decentralised exchange`

    Market trade

        See :term:`market order`

    Rebalance

        In a :term:`trading strategy`, rebalance refers to the process of re-weighting the portfolio
        by selling some assets and buying new ones.

        Rebalances are needed in order for the strategy to follow its :term:`alpha model`.

        Rebalances can be done at fixed intervals, usually hourly, daily or weekly.

        In the process, the strategy opens new and closes existing :term:`positions <position>`.

        See also

        - :term:`Portfolio construction`

        - :term:`Position`

        - :term:`Alpha model`

        - :term:`Trading strategy`

