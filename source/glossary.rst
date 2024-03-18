.. _glossary:

Glossary
========

Here you can find terminology used in the documentation, decentralised finance
and algorithmic trading.

.. glossary::
    :sorted:


    Trading strategy

        In :term:`quantitative finance`, a trading strategy is a fixed plan that is designed to achieve a profitable returns for its investors.

        Common trading strategies include:

        - :term:`Buy and hold`

        - :term:`Portfolio construction`

        - :term:`Algorithmic trading`

        - Index investing

        A trading strategy may look to optimise :term:`cumulative profit` or :term:`risk-adjusted return`.

        Further strategies can be classified by their activity and risk profile as

        - :term:`Directional strategies <directional strategy>` that are :term:`volatile`

        - :term:`Active strategies <active strategy>`

        - :term:`Passive strategies <passive strategy>`

        The trading strategy can be automated as :term:`algorithmic trading` and thus
        become :term:`automated trading strategy`. Automated strategies
        can be e.g.

        - :term:`Technical indicator`-based strategies

        - Trend-following

        - Market-making (see :term:`AMM` for :term:`decentralised finance`)

        - Arbitrage

        - Scalping

        - :term:`Portfolio construction model` or :term:`tactical asset allocation`

        - :term:`Market neutral <Market neutral strategy>`, or :term:`delta neutral`

        - :term:`Yield farming`

        Trading strategies can be objectively compared to each other.
        This is called :term:`benchmarking <benchmark>`.

        Trading Strategy can also refer to :term:`Trading Strategy Protocol`
        which is a solution for creating trading strategies for
        :term:`decentralised finance`.

        See also

        - :term:`Best trading strategy`

        - :term:`Trading Strategy Protocol`

        - :term:`Algorithmic trading`

        - :term:`Technical analysis`

        - :term:`Automated trading strategy`

        - :term:`Best trading strategy`

        - :term:`Alpha generation platform`

        - :term:`Equity curve`

        - :term:`High-frequency trading`

        - :term:`Market neutral strategy`

        - :term:`Factor investing`

        - :term:`Yield farming`

    AMM
        Automated market maker (AMM) is a :term:`bonding curve` based :term:`decentralised exchange`.

        An automated market maker (AMM) is a type of decentralised exchange (DEX) :term:`protocol` that uses algorithmic smart contracts to make it easy for individual traders to buy and sell crypto assets. Instead of trading directly with other people as with a traditional order book, users trade directly through the AMM. AMMs facilitate the decentralised exchange of digital assets using liquidity pools rather than conventional market order books.

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

        - :term:`Protocol`

    CLMM

        CLMM stands for Concentrated Liquidity Market Maker.

        CLMM is a form of :term:`AMM`.
        CLMMs provide more capital-efficient :term:`liquidity` on a :term:`DEX`.

        CLMM :term:`protocol` allows :term:`liquidity providers <liquidity provider>` to set specific price ranges,
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

        - :term:`Protocol`

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

        - :term:`AMM`

        - :term:`CLMM`

        - :term:`Order book`

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
        Often forks are also called :term:`clones <clone>`.

        In the context of :term:`on-chain` forks, forks usually are hostile to the original project and competes from the
        same users. Forks often do not innovate, or make the product technically better.

        Unlike traditional open source projects, fork rarely co-operate. Because many forks
        lack the same technical understanding as the original founding tech team, forks suffer from hacks
        and are often abandon after a short period of time.

        Forks in practice:

        - Blockchains can be forked. The most forked blockchain is Ethereum and its :term:`EVM <EVM Compatible>`
          architecture. Ethereum forks include Polygon, BNB Smart Chain, Avalanche C-Chain, Fantom.

        - :term:`Uniswap` is the most forked :term:`protocol`. Uniswap forks include :term:`Sushi`,
          PancakeSwap, Trader Joe and others

        See also

        - :term:`Decentralised finance`

        - :term:`Protocol`

        - :term:`Smart contract`

    Candle

        Candle, or a candlestick is a type of price chart used in technical analysis that displays the high, low, open, and closing prices of an asset for a specific time period, or :term:`bucket`.

        `More information on Wikipedia <https://en.wikipedia.org/wiki/Candlestick_chart>`__.

        See also

        - :term:`OHLCV`

        - :term:`Bucket`

    Time frame

        See :term:`bucket`.

    Bucket

        The (time) bucket to a time period for :term:`candle` data. It is also known time frame by some systems.

        For example, you can have one minute, one hour or time buckets, describing for the what period of a time the candle includes the trades.

        Also known as time frame, candle length or candle duration.

        See also

        - :term:`OHLCV`

        - :term:`Bucket`

        - :term:`Trading strategy`

        - :term:`Forward fill`

    OHLCV

        A typical :term:`candle` contains open, high, low and close price and trade volume for a :term:`time bucket <bucket>`. Because on-chain exposes more data than centralised exchanges, Trading Strategy data also contains individual buys and sells, US dollar exchange rate and so forth.

        See also

        - :term:`Candle`

        - :term:`Bucket`

        - :term:`Trading strategy`

        - :term:`Forward fill`

    Parquet

        Parquet is a columnar storage format for big data processing and analysis, commonly used in the Apache Hadoop and Apache Spark ecosystems. It is optimised for fast querying and efficient storage of large, complex data sets, and supports a wide range of data formats and compression options. By organising data into columns rather than rows, Parquet enables more efficient compression and encoding, as well as improved query performance, making it a popular choice for data warehousing and analytics applications. `More information <https://parquet.apache.org/>`__.

        Parquent comes from Apache :term:`Arrow` ecosystem.

        Parquet files have internal compression, usually :term:`Zstd`, to make transferring large data series faster.

        See also

        - :term:`PyArrow` - Python library

        - :term:`Apache Arrow` - open source data science ecosystem project

        - :term:`OHLCV` - market and price data type

        - :term:`Zstd`

    PyArrow

        PyArrow is Python API for :term:`Arrow` library.

        PyArrow is an open-source Python library that provides a fast, efficient way to process and analyse large :term:`datasets <dataset>`, especially those in Apache Arrow format. It is used for handling columnar and/or chunked data in memory, including reading and writing data from/to disk and interprocess communication. PyArrow also provides a rich set of data structures and algorithms for working with arrays, tables, and data frames, as well as support for various data formats such as :term:`Parquet`, Avro, ORC, and others. The library is designed to be highly performant and can be used in a variety of applications, including data science, machine learning, and data engineering.

        `More information <https://arrow.apache.org/docs/python/>`__.

        See also

        - :term:`Apache Arrow` - native library

        - :term:`Parquet` - file format

        - :term:`Python` - programming language

        - :term:`Jupyter Notebook` - data research tool

        - :term:`Trading Strategy Framework` - build automated :term:`trading strategies <trading strategy>` with Python

    Arrow

        See :term:`Apache Arrow`.

    Apache Arrow

        Apache Arrow is an open-source, cross-platform columnar data format that is used for storing and processing large amounts of data efficiently. It was designed to address some of the performance and scalability challenges associated with traditional row-based data storage and processing methods.

        Arrow provides a common format for storing data, which can be used across multiple platforms and programming languages, including C++, Java, :term:`Python`, and R. This allows for faster data processing and improved performance, as data can be shared and processed efficiently between different applications and systems.

        In addition to its performance benefits, Arrow also provides a number of other advantages, such as support for a wide range of data types and low overhead. This makes it well-suited for use in big data and analytics applications, as well as other data-intensive projects with large :term:`datasets <dataset>`.

        `More information <https://arrow.apache.org/docs/index.html>`__.

        See also

        - :term:`PyArrow` - Python library

        - :term:`Parquet` - file format

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

        - :term:`Best trading strategy`

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

        Market neutral strategies are :term:`trading strategies <trading strategy>` that have little or no :term:`exposure` to crypto asset :term:`volatility`. They are often :term:`high-frequency trading` strategies, like arbitrage. Good market neutral strategies can make 10% - 20% monthly yield in cryptocurrency markets.

        See also

        - :term:`Delta neutral`

        - :term:`Trading strategy`

        - :term:`Risk-adjusted return`

        - :term:`Best trading strategy`

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

        - :term:`Protocol`

    Traditional finance

        In :term:`decentralised finance`, traditional finance or TradFi, refers to the old financial system.

        TradFi consists of regulated securities markets, banks, commodities and FX markets.
        TradFi markets are considered to be inefficient compared to :term:`decentralised finance`,
        due to excessive amount of middlemen, :term:`custodials <custodial>` and  lack of automation.

        See also

        - :term:`Decentralised finance`

        - :term:`Decentralised exchange`

        - :term:`Lending protocol`

        - :term:`Protocol`

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

        A proprietary trading strategy programming language for :term:`TradingView`. `Read more <https://www.tradingview.com/support/solutions/43000561836-what-is-pine-script/>`__. Pine Script is a high-level scripting language that is specifically designed for use in creating custom trading indicators and strategies for financial markets. It is used by traders to create custom technical indicators, such as moving averages, :term:`Bollinger Bands`, and Relative Strength Indicators, as well as more complex algorithms for automated trading.

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

        :term:`DEX <decentralised exchange>` swap orders have a slippage tolerance parameter with them. You set it when the order is created.
        If the price changes more then the slippage tolerance between the creation of the order and the execution of the order,
        the DEX will cancel the order (revert).

        Setting a low slippage tolerance value prevents frontrunning your trades, because frontrunners cannot
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

        See also

        - :term:`Environment file`

        - :term:`Python`

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

        See also

        - :term:`Decentralised finance`

        - :term:`Algorithmic trading`

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

        - :term:`Open position`

        - :term:`Closed position`

    Trading universe

        A trading universe describes all possible assets available for a :term:`strategy`
        for its to take different :term:`trading positions <position>`. The simple
        trading strategies trade only a single trading pair like ETH/USD. More complex
        strategies can have trading universe consisting of thousands of trading pairs
        and assets.

    Factor investing

        Factor investing is a :term:`trading strategy` that chooses securities based on attributes that have historically been associated with higher returns.

        There are two main types of factors: macroeconomic and style. Investing in factors can help improve portfolio outcomes, reduce volatility and enhance diversification.

        `Read more <https://learn.aikido.finance/blog/post/how-to-choose-an-algorithmic-trading-strategy-stocks/>`__.

        See also

        - :term:`Portfolio construction`

        - :term:`Portfolio`

        - :term:`Trading strategy`

        - :term:`Alpha`

    Alpha generation platform

        In :term:`quantitative finance`, alpha generation platform is a technology used in algorithmic trading to develop quantitative financial models, or :term:`trading strategies <trading strategy>`, that generate consistent returns.

        Alpha generation platforms are tools used by hedge funds, banks, CTAs and other financial institutions to help develop and test quantitative trading strategies.
        Alpha generation platforms support quants in the creation of efficient and productive quantitative trading strategies.

        `Read more <https://en.wikipedia.org/wiki/Alpha_generation_platform>`__.

        See

        - :term:`Alpha`

        - :term:`Alpha model`

        - :term:`Portfolio construction`

        - :term:`Trading strategy


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

        Malicious Extractable Value (MEV) is a measure of the profit a blockchain block producer can make through their ability to arbitrarily include, exclude, or re-order transactions during the block production process. It refers to the maximum amount of value that can be extracted from block production in excess of the standard block reward and gas fees.

        MEV is also known as Miner Extractable Value (original proof-of-work term) and Maximum Extractable Value.

        MEV is applicable to a blockchain that have a consensus model where there is a single elected leader for each block, round or epoch (terminology varies).
        This leader sees the content of new transactions and can decide what are transactions and which order they are going to be included in the next block,
        effectively deciding the final execution order of the transcations.
        The leader can also insert their own transactions to at any point of the new block.
        If any of transactions contain trades, the leader can insert their own trades before or after the transactions of other blockchain users.

        A block producer in a position to do MEV can harm traders in multiple ways:

        - MEV operators *frontrun* trades and liquidity provisions to get a better price for themselves as they see the market is about to change,
          by inserting their own trades before others.

        - MEV operators perform `sandwitch attack <https://tradingstrategy.ai/glossary/evm>`__ to manipulation the market, by frontrunning and backrunning s single trade to set the price to some arbitrary value.

        - MEV operators *backrun* trades and extract any arbitrage opportunities which open up after executing a trade.

        Because of MEV, traders using blockchain may lose money they would not lost in trading otherwise.
        Ethereum mainnet block producers have been manipulating on-chain markets via MEV since 2020. This money goes to the block producers as excessive profits from their MEV trades.
        Most of MEV is a harmful for traders and protocols as it extracts value out from the system and moves it to a third party, unrelated to the actual trading activity. If a rational trader
        can choose between two otherwise equal markets, they will always choose the market without MEV.

        From community acceptance and legal standpoint a third-party MEV, where traders and the protocols are not participants, can be considered harmful:

        - Frontrunning and market manipulation are illegal in many jurisdictions and different contexts.

        -`Backrunning is generally found acceptable <https://twitter.com/TradingProtocol/status/1697627466267779389>`__,
          especially if it distributes some of arbitrage profits back to traders and protocols.

        Not all blockchains are suspectible to MEV.
        Getting rid of MEV is often referred as "solving MEV" or "minimising MEV."

        MEV can be prevented and mitigated by

        - Making transactions invisible to block producers. This is called to shuttering or shielding. One way to achieve this
          is to use two-phase `commit and reveal scheme <https://en.wikipedia.org/wiki/Commitment_scheme>`__, also known as commitment scheme. for including transactions in a block.
          In this scheme, the block producers ability to see the transaction content is removed. Commit-and-reveal schemes can happen on the block production level (hardcoded
          for all transactions) or on the application level (a special :term:`DEX` smart contract needed with two separate transactions).
          `Shutter Network <https://shutter.network/>`__ is a commit-and-reveal scheme for :term:`EVM` block building. Commit-and-reveal schemes usually do not
          remove the block producers ability to do backrunning.

        - Setting a :term:`slippage` tolerance for traders. The slippage is the amount of price change between the user creating a trade
          and the time the trade gets executed. If the trade outcome is not within the slippage tolerance, the trade fails and the trader
          may try again. The slippage tolerance sets the upper bound for the value frontrun and sandwich attacks can extract. However,
          the requirement to use tight slippage tolerance to avoid harmful MEV will also cause legimate trades to fail, and MEV participants
          will still extract value, just lower.

        - Using private mempools. A mempool is a public peer-to-peer network where transactions are broadcasted before they are included in a block.
          A private mempool operator submits transactions to the block producers with a honour agreement "do not negatively manipulate these"
          and there is some sort of revenue sharing agreement with the private mempool operator and block producers about this.
          Multiple private mempool solutions for :term:`EVM` blockchains exist. Users are incentivised to use a private mempool
          by paying back some of the backrun arbitrage profits from users trades in the form of a kickback.
          A simple solution for ordinary users is to change the :term:`JSON-RPC` node configuraiton of a wallet to point to  in the form of a kickback.
          a private mempool, like `MEV Blocker <https://mevblocker.io/>`__. So far all private mempools are trust-based, so they are not ideal
          solution as a rogue private mempool operator does not need to respect any honour agreements.

        - Backrunning built into the protocol itself to capture any arbitrage left after routing a trade. Osmosis is doing this
          if the form of `ProtoRev module <https://docs.osmosis.zone/osmosis-core/modules/protorev/>`__. More about `ProtoRev solution here <https://osmosis.zone/blog/osmosis-protorev-by-skip-protocol-on-chain-app-directed-arbitrage>`__.
        - Most :term:`EVM-compatible` blockchains and virtual machines are not powerful enough to do backrunning on-chain, but off-chain solutions like `CowSwap <https://swap.cow.fi/>`__ and `MEV Blocker <https://mevblocker.io/>`__ exist.

        - Creating a blockchain block production system where there is no single leader who can decide on transactions. `See Advanced consensys system design presentation here <https://www.youtube.com/watch?v=SFpEPjY-sxs>`__.

        - Having a blockchain that is too dumb to support logic needed to calculate trades. Bitcoin is such a blockchain and that's
          why there cannot be trading on Bitcoin, and all of its trading needs to happen outside native Bitcoin blockchain.

        - CEX-DEX arbitrage, though not always MEV but harmful for :term:`decentralised finance` ecosystem due to its harm for passive liquiditity providers, can be mitigated with dynamic fees, introduced by :term:`Uniswap` version 4. `More on dynamic fees mitigating arbitrage here <https://doseofdefi.substack.com/p/uniswap-v4-and-ambient-finance-fresh>`__.

        See also

        - :term:`DEX`

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
        and are :term:`protocol` based where users connect with their :term:`wallets <wallet>`.
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

        - :term:`Protocol`

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

        `Read more about token tax <https://tradingstrategy.ai/blog/transfer-fees-token-taxes-and-honeypots>`__ in our introduction blog post.

        Taxed tokens are not supported by Uniswap 3. Note that any bridged tokens cannot have transfer fees,
        so if you bridge a taxed token from Ethereum mainnet e.g. to Polygon it will work on Uniswap v3.

        - `Uniswap v3 documentation about token transfer fees <https://docs.uniswap.org/concepts/protocol/integration-issues#fee-on-transfer-tokens>`__

        - `The underlying issue on Paxos Gold (PAXG) token on Uniswap v3 <https://github.com/Uniswap/v3-core/issues/565#issuecomment-1158039767>`__

        - `PAXG token trading on Uniswap v3 on Polygon <https://tradingstrategy.ai/trading-view/polygon/uniswap-v3/paxg-usdc-fee-30>`__

        See also

        - :term:`swap fee`

        - :term:`honey pot`
        
    Order book
    
        An order book is a type of market that operates based on an order book, a record of all buy and sell orders for a particular asset.

        In an order book exchange, users can place limit orders, specifying the price and quantity they are willing to buy or sell an asset for. When a matching buy and sell order is found, a trade is executed, and the exchange takes a small fee for facilitating the transaction. Order book exchanges provide more precise price discovery and allow users to take advantage of market inefficiencies, but can suffer from liquidity issues and are more susceptible to front-running and other forms of market manipulation.

        Overall, order book exchanges offer a more traditional trading experience compared to Automated Market Maker (AMM) exchanges, but with the added benefits of being decentralised and secure.

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

    Momentum

        In :term:`trading strategy`, momentum refers to the rate of change in the price of a financial asset over a given period of time.

        The price change si often expressed as a change in the :term:`open-close data <OHLCV>`. E.g. the price of an asset
        at the opening of the week vs. closing price as the end of the week.

        Momentum traders seek to profit from short-term price trends by buying assets that have been performing well and selling those that have been performing poorly.

        Momentum traders typically use technical analysis to identify assets that are exhibiting strong positive or negative momentum. They may look at indicators such as :term:`moving averages <EMA>`, relative strength index (:term:`RSI`), and MACD (moving average convergence divergence) to determine the current trend and potential entry and exit points.

        One common strategy used by momentum traders is to buy assets that have recently experienced a significant price increase, on the assumption that the upward trend will continue. This is known as a "breakout" strategy. Conversely, they may sell assets that have experienced a significant price decrease, on the assumption that the downward trend will continue.

        It is important to note that momentum trading can be risky, as price trends can quickly reverse direction, leading to significant losses if a trader's positions are not properly managed. It is therefore important for traders to have a well-defined strategy, strict risk management rules, and the discipline to stick to their plan even in the face of short-term fluctuations.

        See also

        - :term:`OHLCV`

        - :term:`Trend`

        - :term:`Technical indicator`

        - :term:`EMA`

        - :term:`Trading strategy`

    Bollinger bands
    
        Bollinger Bands are a technical analysis indicator used to measure market volatility and identify potential buying or selling opportunities. The indicator consists of a set of three lines plotted on a price chart, with the middle line being a simple moving average of the security's price, and the upper and lower bands serving as a measure of volatility, typically set 2 standard deviations away from the moving average.

        In a market with low volatility, the Bollinger Bands will be closer together, while in a market with high volatility, the bands will be further apart. When prices move outside the upper band, it can be a sign that the security is overbought, and a potential selling opportunity, while a move below the lower band can indicate that the security is oversold and a potential buying opportunity.

        Bollinger Bands are widely used by traders and investors in making investment decisions, as well as in setting stop-loss orders and determining potential profit targets.

        `Read technical deep dive into Bollinger Bands <https://school.stockcharts.com/doku.php?id=technical_indicators:bollinger_bands>`__.

        See also

        - :term:`Technical indicator`

        - :term:`Trading strategy`

        - :term:`Trend`

    Relative strength index (RSI)

        The Relative Strength Index (RSI) is a popular momentum indicator used in :term:`technical analysis` to measure the strength of a security's price action. It compares the magnitude of recent gains to recent losses, in order to determine overbought or oversold conditions, and potential buying or selling opportunities.

        The RSI is calculated as a ratio of average gains to average losses, and is represented as a value between 0 and 100. Values above 70 are considered overbought and may indicate a potential sell opportunity, while values below 30 are considered oversold and may indicate a potential buy opportunity. The RSI can be used for various time frames and for multiple securities, including individual stocks, bonds, commodities, and currencies.

        See also

        - :term:`Technical indicator`

        - :term:`OHLCV`

        - :term:`Trend`

        - :term:`EMA`

        - :term:`Trading strategy`

    RSI

        See :term:`Relative strength index (RSI)`

    Fundamental analysis
    
        Fundamental analysis is a method used in finance and investing to evaluate the intrinsic value of a security or asset by examining its underlying economic and financial characteristics and performance. The goal of fundamental analysis is to assess the economic viability and financial health of a company, and to determine if the current market price of its securities reflects its true worth.

        In fundamental analysis, investors analyse a wide range of financial and economic data, including financial statements, industry trends, and macroeconomic indicators, to gain insight into a company's earnings potential, growth prospects, and risk factors. Key metrics analysed include revenue, earnings, profitability, and cash flow, as well as debt levels, management quality, and competitive position.

    Systematic trading

        Systematic trading is a method of trading financial markets that utilises mathematical models and algorithms to execute trades based on predefined rules and conditions. It aims to remove emotion and subjectivity from the investment process by relying on data-driven decision making.

        In systematic trading, trades are executed automatically based on the rules established in the trading system. These rules can be based on technical indicators, market data, or other signals, and are designed to identify and take advantage of market inefficiencies and price discrepancies. The models used in systematic trading are typically back-tested using historical market data to assess their viability and refine their parameters.

        Systematic trading is often used in quantitative finance and high-frequency trading, where trades are executed at a high rate and on a large scale. It can be applied to a wide range of financial instruments, including stocks, bonds, :term:`futures`, :term:`options`, and currencies.

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

    Protocol

        In :term:`decentralised finance`, a protocol is :term:`non-custodial` financial service.

        In protocol, its users are doing directly transactions :term:`on-chain` with each other without intermediates,
        in peer-to-peer manner. Protocols can be built into a blockchain or be smart contract based.

        Unlike in traditional finance, in decentralised finance the user is always in control
        of their assets, making protocols different from centralised services.

        See also

        - :term:`Decentralised finance`

        - :term:`Lending protocol`

        - :term:`Total value locked`

        - :term:`On-chain`

        - :term:`Non-custodial`

    Lending protocol

        A lending protocol is a :term:`decentralised finance` service for lending and borrowing :term:`tokens <token>`.

        Lending protocols are :term:`smart contract`-based :term:`non-custodial` protocols to
        lend and borrow your assets.

        Lending protocols enable :term:`shorting` of different :term:`lending pool` tokens.

        Popular lending protocols include :term:`Aave`, Compound and Euler.

        See also

        - :term:`Protocol`

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

        See also

        - :term:`Parquet`

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

        For EVM-compatible chains

        - Same Solidity and Vyper smart contracts work

        - Same JSON-RPC API works

        - Same wallets work, assuming your wallet gives you an option to set up a node JSON-RPC URL
          to a different EVM chain

        - Same libraries like Web3.py and Web3.js, SDKs and development tools work

        However, you might need

        - Run a blockchain node yourself

        - Get another node provider as there is no consistency of who is running, connecting and offering
          services to different peer-to-peer networks

        `For an example list of EVM-compatible blockchains see Trading Strategy's supported blockchains <https://tradingstrategy.ai/trading-view/blockchains>`__.

        See also

        - :term:`EVM`

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

        See :term:`best trading strategy`.

    Best trading strategy

        The best trading strategy is one that makes most excessive profit, or :term:`alpha`,
        for the least risk.

        Depending on the the market situation and available :term:`trading pairs <trading pair>`,
        the current best trading strategy can vary day by day, or depending whether the markets are in
        :term:`bull market` or :term:`bear market`. Also, depending on the trader risk apetitve

        A trading algorithm can generally yield 5% - 300% yearly profit depending on the
        amount of deployed capital and the market size. The goal is to beat :term:`risk-free rate`,
        with :term:`risk-adjusted return` having profits enough to cover any :term:`volatility` or other risk taken.

        In :term:`quantitative finance`, different trading strategies can be objectively compared
        based on their performance metrics.
        Some usual ways to :term:`benchmark` include:

        - :term:`Cumulative profit` or :term:`Compound Annual Growth Rate (CAGR)`

        - :term:`Risk-adjusted return`, like :term:`Sharpe` and :term:`Sortino` ratios

        See also

        - :term:`Alpha`

        - :term:`Risk-adjusted return`

        - :term:`Profitability`

        - :term:`Trading strategy`

        - :term:`Benchmark`

        - :term:`Buy and hold`

        - :term:`Trading algorithm`

        - :term:`Algorithmic trading`

        - :term:`Quantitative analysis`

    Risk-adjusted return

        Risk-adjusted return is a calculation of the return (or potential return) on an investment such as a stock or corporate bond when compared to the amount of risk the investment has represented throughout a given period of time.

        It is measured by taking into account the risk associated with an investment and comparing it to its return.
        The risk can be measured e.g. as a :term:`maximum drawdown`.

        See also

        - :term:`Risk-free rate`

        - :term:`Best trading strategy`

        - :term:`Cumulative profit`

        - :term:`Equity curve`

        - :term:`Drawdown`

        - :term:`Maximum drawdown`

        - :term:`Quantstats`

        - :ref:`Profitability calculations <profitability>`

    Cumulative profit

        In :term:`quantitative finance`, cumulative profit tells the overall profit of :term:`trading strategy` over a time.

        Cumulative profit is the excess of net income and gains over net losses, determined on a cumulative basis from the inception of an investment fund through to its termination date.
        It includes realized trading P&L, positions open P&L, and other total profits or losses generated since the :term:`trading strategy`'s inception.

        As trading strategies reinvest earlier profits, the cumulative profit :term:`compounds <compound>`.

        Cumulative profit is expressed as % of yearly gains, as:

        - :term:`Compound Annual Growth Rate (CAGR)` (volatile trading)

        - :term:`Annual Percentage Yield (APY)` (loans, :term:`delta neutral` strategies)

        To calculate cumulative profit, one must add together all net profit numbers over a specific time frame.

        If a trading strategy automatically reinvests its profits to itself, it is called :term:`auto-compounding`.

        See also

        - :term:`Compound`

        - :term:`Auto-compounding`

        - :term:`Compound Annual Growth Rate (CAGR)`

        - :term:`Annual Percentage Yield (APY)`

        - :term:`Profitability`

        - :term:`Risk-adjusted return`

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Equity curve`

        - :term:`Drawdown`

        - :term:`Best trading strategy`

    Profitability

        In :term:`quantitative finance`, profitability tells how much a :term:`trading strategy`
        has generated or is estimated to generate profits.

        The profitability is expressed usually as yearly returns %. E.g. 20% profitability means that the trading strategy generates 1/5x return on investment capital
        yearly.

        For multi-user trading strategies, profitability calculations get more complex as you need to take account
        the funding flow, deposits and redemptions.

        TradingStrategy.ai offeres several methods of profitability calculation, for details see :ref:`Profitability calculations <profitability>` documentation.

        - :ref:`Compounding realised positions profit` is the preferred method to display profitability across
          different strategies

        See also

        - :term:`Cumulative profit`

        - :term:`Risk-adjusted return`

        - :term:`Drawdown`

        - :term:`Best trading strategy`

    Equity curve

        An equity curve is a graphical representation of the change in the value of a trading account over a time period.

        Equity curves are used by traders to determine the viability of their :term:`trading strategies <trading strategy>`.
        A good equity curve has an even slope, small and short-lived :term:`drawdowns <drawdown>`, and a good amount of trades to make the observation statistically significant.

        Equity curve trading is a methodology where a trading strategy is turned on and off based on the performance of an equity curve, which is a plot showing the growth of capital over time from one specific :term:`trading strategy` or portfolio.

        See also

        - :term:`Total equity`

        - :term:`Trading strategy`

        - :term:`Risk-adjusted return`

        - :term:`Cumulative profit`

        - :term:`Drawdown`

    Auto-compounding

        Auto-compounding is a :term:`trading strategy` in which the investors's investment yields are automatically reinvested into the investment principal at regular intervals.
        This is called :`compound`.

        Auto-compounding strategies are :term:`benchmarked <benchmark>` using metrics having compounding factored in

        - :term:`Compound Annual Growth Rate (CAGR)`

        - :term:`Annual Percentage Yield (APY)`

        Compounding is a powerful investing concept that involves earning returns on both the original investment and on returns received previously.

        See also

        - :term:`Cumulative profit`

        - :term:`Compound`

        - :term:`Compound Annual Growth Rate (CAGR)`

        - :term:`Annual Percentage Yield (APY)`

        - :term:`Trading strategy`

        - :term:`Risk-adjusted return`

        - :term:`Cumulative profit`

        - :term:`Drawdown`

    BNB Chain

        See :term:`BNB Smart Chain`.

    BNB Smart Chain

        BNB Smart Chain is an :term:`EVM-Compatible` blockchain from the Binance cryptocurrency exchange.
        It is called as :term:`BNB Chain`, though these two are separate.

        BNB Smart Chain is a direct :term:`fork` of Ethereum.

        BNB Smart Chain offers good interaction with the Binance cryptocurrency exchange (:term:`CEX`), making it attractive
        for the users of this exchange. As of the writing of this, Binance has a 70% market
        share of the cryptocurrency trading volume, making it very dominant in the blockchain industry.

        BNB Smart Chain is based on centralised, proof-of-authority. model.
        `BNB Chain was recently halted in a hack <https://cointelegraph.com/news/bnb-chain-confirms-bsc-halt-due-to-potential-exploit>`__.
        It uses `BNB token <https://tradingstrategy.ai/trading-view/binance/tokens/0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c>`__
        as its :term:`native token`.

        The dominating :term:`decentralised exchange` on BNB Chain is `PancakeSwap <https://tradingstrategy.ai/trading-view/binance/pancakeswap-v2>`__.

        See also

        - :term:`EVM-compatible`

        - :term:`Fork`

        - :term:`Decentralised finance`

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

        - Read the API documentation for :py:class:`tradingstrategy.client.Client`

        - `See the project Github README <https://github.com/tradingstrategy-ai/trading-strategy/>`__

        See also

        - :term:`Trading Strategy Framework`

        - :term:`Trading strategy Protocol`

        - :term:`Backtest`

        - :term:`OHLCV`

    Trading Strategy Protocol

        Trading Strategy Protocol is an :term:`algorithmic trading` solutions for :term:`decentralised finance`
        using :term:`AMMs <amm>` and :term:`lending protocols <lending protocol>`.

        It offers :term:`non-custodial` way for creating :term:`trading strategies <trading strategy>`.
        :term:`Quants <quant>` can develop and :term:`backtest` their strategies using :term:`Python`.

        Live trading strategies can be securely executed using :term:`vaults <vault>`.

        For introduction information, `visit Trading Strategy website <https://tradingstrategy.ai/>`__.

        See also

        - :term:`Trading Strategy Client`

        - :term:`Trading Strategy Framework`

        - :term:`Algorithmic trading`

        - :term:`Decentralised finance`

        - :term:`Quantitative finance`

        - :term:`Automated trading strategy`

        - :term:`Technical analysis`

    Trading Strategy Framework

        The Trading Strategy Framework is a :term:`Python`-based software development library
        to develop :term:`automated trading strategies <automated trading strategy>` for :term:`decentralised finance`
        markets. The core audience of the library is :term:`quants <quant>`.

        The framework consists of

        - Market data feed reader in the form of :term:`Trading Strategy Client`

        - :term:`Backtesting framework <backtest>` based on :term:`Jupyter Notebook`

        - :ref:`Live trading execution environment <running strategies>`

        - Third-party capital deposits using :term:`vaults <vault>`

        See also

        - :term:`Trading strategy`

        - :term:`Algorithmic trading`

        - :term:`Trading Strategy Protocol`

        - :term:`Trading Strategy Client`

        - :term:`Decentralised finance`

        - :term:`Backtest`

        - :term:`Python`

        - :term:`Jupyter Notebook`

        - :term:`PyArrow`

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

        Portfolio construction a :term:`trading strategy method <trading strategy>` of selecting securities to your :term:`portfolio` optimally to achieve maximum returns while taking minimum risk.

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

    Portfolio

        In :term:`quantitative finance`, portfolio means the list of assets that a :term:`trading strategy` is currently holding.

        Assets can include

        - Equity - stocks

        - Bonds - loans

        - Cryptocurrencies

        - Derivatives

        Depending on the asset, the holdings are expressed as assets, or tokens in cryptocurrencies and :term:`trading pair` (derivatives).

        When the portfolio changes, assets are bought or sold, it is called :term:`rebalancing <rebalance>`,

        See also

        - :term:`Portfolio construction`

        - :term:`Alpha model`

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Risk-adjusted return`

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

        In :term:`quantitative finance` and :term:`portfolio construction`, an alpha signal refers to a metric or indicator used to identify investments that are likely to outperform the broader market. Alpha signals can be derived from a variety of sources, including fundamental analysis, technical analysis, and quantitative models. Portfolio construction is a specific type of :term:``trading strategy`.

        Alpha signals are also known as *trading signals*.

        The goal of using an alpha signal is to identify securities that are undervalued or overvalued compared to their peers, and to use that information to construct a :term:`portfolio` that generates excess returns (i.e., alpha) relative to a benchmark index.

        Examples of alpha signals include measures of company profitability, earnings growth, price momentum, and valuation ratios. A portfolio manager may use one or more alpha signals to construct a portfolio that is expected to outperform the benchmark index.

        Some of the common alpha signals include

        - :term:`Trading pair` momentum, or the raw price movement

        - :term:`Technical indicators <technical indicator>`

        - Machine learning-based indicators extracted from :term:`OHLCV` market data

        - :term:`Alternative data` sources and their derivatives

        When alpha signals of different industry verticals are compared, it is called :term:`factor investing`.

        See also

        - :term:`Portfolio construction`

        - :term:`Alpha model`

        - :term:`Trading strategy`

        - :term:`Risk-adjusted return`

        - :term:`Benchmark`

        - :term:`Best trading strategy`

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

        In a :term:`trading strategy`, rebalance refers to the process of :term:`re-weighting <weight allocation>` the :term:`portfolio`
        by selling some assets and buying new ones.

        Rebalances are needed in order for the strategy to follow its :term:`alpha model`.

        Rebalances can be done at fixed intervals, usually hourly, daily or weekly.

        In the process, the strategy opens new and closes existing :term:`positions <position>`.

        See also

        - :term:`Portfolio`

        - :term:`Portfolio construction`

        - :term:`Weight allocation`

        - :term:`Position`

        - :term:`Alpha model`

        - :term:`Trading strategy`

    Weight allocation

        In :term:`portfolio construction`, the weight allocation determines how many percents an individual asset :term:`position`
        will make out of the total portfolio.

        One of the simplest weight allocation method is "1/Nth" allocation: the asset with the strongest :term:`alpha signal`
        receives 1/1th multiplier, the second asset 1/2th. The weightings are then normalised so that
        all assets make total of 100%.

        `Read about 1/Nth weight allocation <https://www.r-bloggers.com/2013/06/the-fallacy-of-1n-and-static-weight-allocation>`.

        See also

        - :term:`Portfolio construction`

        - :term:`Position`

        - :term:`Alpha model`

        - :term:`Trading strategy`

    JSON

        JSON (JavaScript Object Notation) is a lightweight data interchange format that is easy for humans to read and write and easy for machines to parse and generate.


        It is a text format that is used to transmit data between a server and a web application, as well as between different parts of a web application.
        JSON is commonly used in web development for tasks such as sending and receiving data between a server and a client-side web application, or for storing data in a format that can be easily exchanged between different systems.

        JSON is based on a subset of the JavaScript programming language, and it is often used with JavaScript, although it can be used with any programming language that can parse and generate JSON data.

        JSON data is organized into key-value pairs, where keys are strings and values can be strings, numbers, arrays, objects, booleans, or null.

        See the `JSON specification <https://www.json.org/json-en.html>`_ for more information.

        Also see an example of using JSON with TradingStrategy data in the `JSON example <https://tradingstrategy.ai/api/explorer/#/Trading%20pair/web_candles>`_

        See also

        - :term:`Python`

        - :term:`JSONL`

    Trailing stop loss

        A trailing stop loss is a special order type or a trigger parameter,
        which will keep updating the :term:`position`'s :term:`stop loss` dollar limit as the market price moves.

        - Trailing stop loss is set on a :term:`position` when opening it

        - Trailing stop loss is usually specified as % of the market price

        - Trailing stop loss dynamically updates the position's stop loss upwards if the market price moves upwards

        - If the market price moves downwards, the highest and the latest trailing stop loss mark is triggered

        - Trailing stop loss allows you to lock in profits in raising markets

        See also

        - :term:`Stop loss`

        - :term:`Position`

        For more information see `Trailing stop Loss on CMC Markets <https://www.cmcmarkets.com/en/trading-guides/trailing-stop-loss>`__.

    Gas fee

        Gas fee is a term used in blockchains to describe the transactions cost a user pays to block producers
        to have their block in includedin the blockchain.

        The gas fee is dynamic. During the blockchain cognestion or high activity, block space is more premium, as users are competing
        to get their transaction included in a block.

        There can be irregular events causing gas fee spikes

        - :term:`Airdops <airdrop>`

        - Popular :term:`NFT` mints

        As the blockchain technology developers, the gas fees, or the transaction costs, are becoming lower and lower.
        New blockchains always are more gas efficient than their predecessors, as their code and consensus mechanisms
        are optimised for higher throughput.
        The costs go down from Bitcoin $20/tx to Ethereum mainnet's 10$ tx to Polygon's 0.20$ to Solana's fractions of cents.

        See also

        - :term:`Protocol fee`

        - :term:`MEV`

    Transaction cost

        How much a user pays to the block producers to have their transaction included in a blockchain.

        Also known as :term:`gas fee`. See :term:`gas fee` for more information.

    API key

        API key is an authentication method for machine-to-machine communications.

        API keys are usually needed with HTTP based API services.

        Blockchain and :term:`decentralised finance` protocols do not need API keys, because the authentication
        happens with public key cryptography and :term:`wallets <wallet>`.

    Quantstats

        Quantstats is a popular :term:`Python` software development library for :term:`quantitative finance` calcualtions and charts.

        It provides many tools out of the box to analyse your strategies, including

        - :term:`Equity curve`

        - Monthly returns and return distribution charts

        - Metrics calculations like :term:`Maximum drawdown` and other :term:`risk-adjusted return` numbers

        `Visit Quantstats repository <https://github.com/ranaroussi/quantstats>`__.

        See also

        - :term:`Quantitative finance`

        - :term:`Risk-adjusted return`

        - :term:`Jupyter notebook`

    Sharpe

        Sharpe, or The Sharpe Ratio, is a widely used financial metric that measures the :term:`risk-adjusted return` of an investment. It was developed by Nobel laureate William F. Sharpe in 1966.

        The Sharpe ratio is calculated by subtracting the risk-free rate (such as the yield on a Treasury bond) from the return of the investment, and then dividing the result by the standard deviation of the investment's returns. The formula is:

        `Sharpe Ratio = (Return of investment - Risk-free rate) / Standard deviation of investment's returns`

        The Sharpe ratio helps investors evaluate an investment's return in relation to the risk taken to achieve that return. A higher Sharpe ratio indicates that an investment has generated higher returns relative to the amount of risk taken, while a lower Sharpe ratio indicates the opposite.

        Generally speaking, a Sharpe ratio above 1 is considered good, and a Sharpe ratio above 2 is considered excellent. However, what is considered good or excellent can vary depending on the context. For example, a lower Sharpe ratio may be acceptable for investments with lower risk or lower volatility, while a higher Sharpe ratio may be necessary for investments with higher risk or higher volatility.

        See also

        - :term:`Sortino`

        - :term:`Risk-adjusted return`

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - `More metrics to compare trading strategies <https://quant.stackexchange.com/a/75378/48108>`__

    Sortino

        The Sortino ratio is a :term:`risk-adjusted return` measure that is used to evaluate the return of an investment relative to its downside risk, as measured by the standard deviation of negative returns. It was developed by Frank A. Sortino, a financial researcher and academic.

        The Sortino ratio is similar to the Sharpe ratio, but instead of using the total volatility of returns, it only considers the downside volatility. This is based on the premise that investors are more concerned with the risk of losing money than they are with the risk of missing out on potential gains.

        The formula for calculating the Sortino ratio is as follows:

        `Sortino ratio = (Rp - Rf) / downside deviation`

        Where:

        `Rp = portfolio return`
        `Rf = risk-free rate of return`
        `Downside deviation = standard deviation of negative returns`

        The Sortino ratio is useful in comparing the risk-adjusted performance of different investments or portfolios. A higher Sortino ratio indicates a better risk-adjusted return, while a lower ratio indicates a lower risk-adjusted return.

        As a rough guide, a Sortino ratio of 1 or higher is considered good, while a ratio of 2 or higher is considered excellent.

        See also:

        - :term:`Sharpe`

        - :term:`Risk-adjusted return`

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - `More metrics to compare trading strategies <https://quant.stackexchange.com/a/75378/48108>`__

    Sentiment analysis

        In :term:`quantitative finance`, Sentiment analysis, also known as opinion mining, is a technique used to analyze and classify the sentiment or emotion expressed in a piece of text. This can be done by using natural language processing and machine learning algorithms to identify and extract subjective information from the text, such as opinions, emotions, and attitudes.

        Sentiment analysis can be used to determine the overall sentiment of a document, sentence, or even individual words, and can help businesses and organizations gain insights into customer feedback, social media posts, and online reviews. By analyzing sentiment, companies can better understand customer needs and preferences, improve their products and services, and make more informed business decisions.

        Sentiment analysis can also be used in a variety of other applications, including political analysis, market research, and brand management.

        There are several libraries available in :term:`Python` that you can use to perform sentiment analysis. One of the most popular libraries is the Natural Language Toolkit (NLTK).

        See also:

        - :term:`Alternative data`

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

    Alternative data

        In :term:`quantitative finance`, Alternative data refers to non-traditional data sources that are used by investors and businesses to gain insights into markets, industries, and consumer behavior. This data is often sourced from digital platforms and devices, such as social media, mobile devices, sensors, and web traffic.

        Alternative data can provide a wealth of information that is not available through traditional data sources, such as financial statements and economic indicators. For example, social media data can be used to gauge consumer sentiment and preferences, while satellite imagery can be used to track changes in physical assets like inventories or construction sites.

        Alternative data is often used in conjunction with traditional data sources to gain a more complete understanding of market trends and consumer behavior. By leveraging alternative data sources, investors and businesses can make more informed investment and business decisions, and gain a competitive edge in their respective markets.

        See also:

        - :term:`Sentiment analysis`

        - :term:`Quantitative finance`

        - :term:`Trading strategy`
    
    Overfitting

        In :term:`quantitative finance`, Overfitting is a term used to describe the phenomenon where a model performs well on the data it was trained on, but poorly on new data. This is often caused by the model learning the noise in the data rather than the underlying pattern.

        Overfitting can be avoided by using a larger :term:`training set`, or by using :term:`regularization` techniques such as dropout or weight decay. It is also important to use cross-validation to ensure that the model is not overfitting to the training data.

        See also:

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - :term:`Training set`
    
    Survivorship bias

        In :term:`quantitative finance`, Survivorship bias refers to the tendency to focus on assets, strategies, or systems that have survived or performed well over a certain period, while ignoring those that have underperformed or ceased to exist. This can lead to an overestimation of the performance or reliability of a trading strategy, as the analysis does not take into account the entire population of assets or strategies.

        Survivorship bias can be mitigated by incorporating a more comprehensive dataset that includes both successful and unsuccessful assets or strategies, and by carefully considering the potential impact of survivorship bias on performance evaluations.

        See also:

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - :term:`Overfitting`

    Look-ahead bias

        In :term:`quantitative finance`, Look-ahead bias occurs when a trading strategy or model uses information that would not have been available at the time the trade was executed. This can lead to an unrealistic assessment of a strategy's performance, as the model appears to have access to future information.

        To avoid look-ahead bias, it is essential to ensure that the data used in backtesting and strategy development is strictly limited to the information that would have been available at the time of the trade. This can be achieved by using time-stamped data and careful data management techniques.

        See also:

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - :term:`Overfitting`

    Risk of ruin

        In :term:`quantitative finance`, Risk of ruin refers to the probability of incurring losses severe enough to render a trading account or strategy unviable. This can occur due to a series of consecutive losing trades, excessive leverage, or poor risk management practices.

        To minimize the risk of ruin, traders should employ prudent risk management techniques, such as setting appropriate position sizes, using stop-loss orders, and maintaining a diversified portfolio. Additionally, monitoring the performance of a trading strategy and making adjustments as needed can help reduce the likelihood of ruin.

        See also:

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - :term:`Risk-adjusted return`
    
    Trend analysis

        In :term:`quantitative finance`, Trend analysis is the study
        of historical market data, such as price and volume, to
        identify patterns and trends that may help predict future
        market movements. This can be a valuable tool for traders and
        investors when developing trading strategies or making
        investment decisions.

        Trend analysis often involves the use of technical indicators,
        such as moving averages, trendlines, and support and resistance
        levels, to analyze and visualize market trends. It can be
        applied to various timeframes, from intraday to long-term,
        depending on the goals and preferences of the trader or investor.

        See also:

        - :term:`Quantitative finance`

        - :term:`Trading strategy`
        
        - :term:`Technical analysis`

    Futures

        In :term:`quantitative finance`, Futures are standardized
        financial contracts that obligate the buyer to purchase an
        asset (or the seller to sell an asset) at a predetermined
        future date and price. Futures contracts are traded on
        organized exchanges and can be based on various underlying
        assets, such as commodities, currencies, or indices.

        Futures contracts are often used for hedging, speculation, or
        price discovery purposes. They allow market participants to
        manage their exposure to price fluctuations and take advantage
        of potential profit opportunities.

        See also:

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - :term:`Options`

    Options

        In :term:`quantitative finance`, Options are financial
        contracts that give the buyer the right, but not the
        obligation, to buy (in the case of a call option) or sell (in
        the case of a put option) an underlying asset at a specified
        price (strike price) on or before a certain date (expiration
        date). The seller of the option, in return, receives a premium
        from the buyer.

        Options are versatile financial instruments that can be used
        for various purposes, such as hedging, speculation, or income
        generation. They allow market participants to manage their
        risk exposure and take advantage of potential profit
        opportunities.

        See also:

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - :term:`Futures`

    Grid search

        Grid search is a :term:`hyperparameter optimization` technique used to find the best combination of hyperparameters for a machine learning model or trading algorithm. Grid search involves exhaustively searching through a manually specified subset of the hyperparameter space and evaluating each combination using a performance metric, such as accuracy or Sharpe ratio.

        Although grid search can be computationally expensive, it is often used when the search space is relatively small or when a more thorough exploration of the hyperparameter space is desired. Other optimization techniques, such as random search or Bayesian optimization, can be more efficient in cases where the search space is large or the performance landscape is complex.

        See also:

        - :term:`Trading strategy`

        - :term:`Hyperparameter optimization`

    Hyperparameter optimization

        Hyperparameter optimization refers to the process of finding the optimal set of hyperparameters for a machine learning model or trading algorithm. Hyperparameters are external configuration settings that cannot be learned directly from the data and must be set before the training process begins.

        Some common hyperparameter optimization techniques include :term:`grid search`, random search, and Bayesian optimization. These methods aim to maximize the performance of the model or algorithm by systematically searching the hyperparameter space and evaluating different configurations using a predefined performance metric, such as accuracy or Sharpe ratio.

        Hyperparameter optimization can help improve the performance of a model or trading strategy by fine-tuning its configuration to better fit the underlying data and problem.

        See also:

        - :term:`Trading strategy`

        - :term:`Grid search`

    Heatmap

        A heatmap is a graphical representation of data that uses color coding to represent the values of a matrix or a two-dimensional dataset. In :term:`quantitative finance`, heatmaps are often used to visualize correlation matrices, volatility surfaces, or other forms of multidimensional data.

        Heatmaps can be useful for quickly identifying patterns or trends in the data, as well as for highlighting areas of high or low values. They can also be used to compare different datasets or to track changes in the data over time.

        Heatmaps can be created using various software tools, such as Python's Matplotlib library or R's ggplot2 package.

        See also:

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

    Environment file

        Environment file, or env file for short, is a standard way to communicate options and arguments
        for a process in software development.

        An environment file consists of `environment variables <https://en.wikipedia.org/wiki/Environment_variable>`__
        maintained as a configuration file.

        There are different environment file formats for UNIX shells, :term:`Docker`, JavaScript and others.
        A tool like `shdotenv <https://github.com/ko1nksm/shdotenv/>`__ can be used to import and convert between
        different formats.

        Typically environment file has a file name extension `.env`. The best practice in JavaScript development
        is to have a file with name `.env` (no name body) that is ignored in version control and contains
        the secrets needed by a software developer for the local development.

        See also:

        - :term:`Python`

        - :term:`Docker`

    EVM

        EVM stands for Ethereum Virtual Machine.

        It is the execution environment that runs Ethereum blockchain transactions and smart contracts.

        - EVM was originally created in 2014 and is old in blockchain architecture terms

        - EVM is used by multiple chains outside Ethereum, like :term:`Avalanche` and :term:`BNB Chain`

        - There exists multiple implementations of EVM in different programming languages: Go, Rust, Python, etc.

        - Some transactions do not concern or touch EVM; for example beacon chain (staking)
          happens partially outside EVM domain

        Due to age and limitations of EVM, there have been efforts to extend EVM for more functionality and faster
        transaction processing. Some efforts include

        - `Aurora - running EVM on more powerful NEAR blockchain <https://aurora.dev/>`__

        - `Stylus - bring WebAssembly based smart contracts to Arbitrum layer two <https://offchain.medium.com/hello-stylus-6b18fecc3a22>`__

        See also

        - :term:`EVM-Compatible`

        - :term:`Decentralised finance`

    Crystallisation

        In :term:`quantitative finance`, "crystallisation" typically refers to the process by which the value of a fund investment is determined or realized. It involves calculating the net asset value (NAV) of the fund and providing investors with a clear picture of their investment's worth.

        Crystallisation in funds occurs at specific intervals, such as daily, weekly, monthly, or quarterly, depending on the fund's valuation frequency. At these intervals, the fund's assets are evaluated, and the NAV per share or unit is calculated. The NAV represents the total value of the fund's assets minus its liabilities, divided by the number of outstanding shares or units.
        
        Investors use the crystallized NAV to assess the value and performance of their fund investments. It allows them to understand the current worth of their holdings and make informed decisions regarding buying, selling, or redeeming fund shares.
        
        Crystallisation is particularly significant in open-end mutual funds and exchange-traded funds (ETFs) where shares can be bought or sold on a regular basis. It provides transparency and liquidity to investors by ensuring that the value of their investments is regularly determined and accessible.
        
        It's important to note that crystallisation in funds does not refer to the same process as crystallisation in investments, where it signifies the realization of gains or losses. Instead, in the fund context, it pertains to the determination of the fund's value for the benefit of investors.

        See also:

        - :term:`Fee model`

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - :term:`Performance fee`

    Performance fee

        In :term:`quantitative finance`, a performance fee is a form of compensation that investment managers or fund managers may receive based on the performance of an investment or a fund. It is typically an additional fee on top of the management fee and is structured to align the interests of the manager with the investors.

        The performance fee is earned when the investment or fund achieves certain predefined performance benchmarks or exceeds a specified hurdle rate. The specific terms and conditions of the performance fee are outlined in the fund's prospectus or investment management agreement.

        The calculation of a performance fee can vary depending on the fund or investment strategy. Commonly, it is calculated as a percentage of the investment gains or profits generated by the fund. For example, if the fund's performance fee is set at 20% and the fund achieves a return of 10%, the performance fee would be 20% of the 10% gain, resulting in a 2% fee. Fees are calculated for a specific :term:`crystallisation` period.

        Performance fees are intended to incentivize fund managers to deliver superior investment results. By linking compensation to investment performance, investors hope to encourage the manager to make strategic investment decisions that maximize returns. It aligns the manager's interests with those of the investors, as the manager benefits from generating positive investment results.

        It's important to note that performance fees are more commonly associated with alternative investment vehicles such as hedge funds, private equity funds, or certain types of actively managed mutual funds. Traditional mutual funds, index funds, or passive investment strategies generally do not include performance fees.

        - :term:`Fee model`

        - :term:`Quantitative finance`

        - :term:`Trading strategy`

        - :term:`Crystallisation`

    Carried interest

        In :term:`quantitative finance`, carried interest refers to a share of profits or investment gains that are allocated to investment managers or general partners in certain types of investment funds, particularly private equity funds, venture capital funds, and sometimes hedge funds. It represents a portion of the fund's profits that the manager or general partner is entitled to receive as compensation.

        Carried interest is typically structured as a profit-sharing arrangement. It is distributed to the investment manager or general partner after the fund's investors, also known as limited partners, have received a predetermined return on their investments, often referred to as the hurdle rate or preferred return. The manager or general partner receives a share of any profits above this hurdle rate, usually a percentage ranging from 10% to 30%.

        The term "carried interest" derives from the concept that the investment manager or general partner carries an interest in the fund's profits, in addition to their capital investment. The carried interest serves as an incentive for the manager to maximize the fund's performance and generate strong investment returns, as their compensation is directly tied to the success of the investments.

        Because carried interest is not exited or liquidated, it is more tax efficient there are no capital gains for holding.

        See also:

        - :term:`Fee model`

        - :term:`Quantitative finance`

        - :term:`Management fee`

        - :term:`Performance fee`

        - :term:`Crystallisation`

    Management fee

        A management fee is a recurring fee charged by investment managers or fund managers for managing and overseeing investment :term:`portfolios <portfolio>` or funds on behalf of investors. It is a compensation mechanism for the services provided by the manager in managing the assets and making investment decisions.

        The management fee is typically calculated as a percentage of the total assets under management (AUM). The percentage fee can vary depending on the type of fund, investment strategy, or asset class. It is usually expressed as an annual rate and is deducted from the fund's assets on a regular basis, such as quarterly or annually.

        The management fee covers various costs associated with managing the fund, including research, analysis, portfolio construction, trading, administrative expenses, regulatory compliance, and compensation for the investment manager's team. It is meant to compensate the manager for their time, expertise, and resources devoted to managing the investments and ensuring the fund's operation.

        Management fees are disclosed in the fund's prospectus or investment management agreement, providing transparency to investors regarding the costs associated with their investment. The fee structure is an important consideration for investors when evaluating investment options, as it directly affects the net return they will receive.

        It's worth noting that management fees are separate from other fees that may be associated with investment funds, such as transaction fees, custodial fees, performance fees (in certain funds), or expense ratios (in mutual funds and ETFs). These additional fees cover specific services or costs beyond the general management of the fund.

        See also:

        - :term:`Fee model`

        - :term:`Quantitative finance`

        - :term:`Management fee`

        - :term:`Performance fee`

        - :term:`Crystallisation`

    Fee model

        In :term:`quantitative finance`, there are different models how traders, investors, strategy developers, funds
        and other stakeholders of the ecosystem are paid for their work.

        There are several fee models

        - :term:`Management fee`: the operator collects % of fees regularly regarless of profit and loss.
          E.g. with 2% management fee, 2% is collected every

        - :term:`Performance fee`: the operator collects fees if an investor is in profit over
          :term:`crystallisation` period.

        - :term:`Carried interest` is uncollected fees for the operator.

        - Deposit and withdrawal fees. E.g. 0.5% is collected when an investor exits.

        See also:

        - :term:`Quantitative finance`

        - :term:`Carried interest`

        - :term:`Management fee`

        - :term:`Performance fee`

        - :term:`Crystallisation`

    Forward fill

        In data research and analysis, "forward fill" refers to a method of handling missing or incomplete data by carrying forward the last observed value to fill in the gaps. It is also known as "last observation carried forward" (LOCF).

        When dealing with time series data or :term:`datasets <dataset>` with missing values, forward fill involves replacing missing data points with the most recent known value. This approach assumes that the value remains constant until a new observation is available. By using the previous observation as a substitute, forward fill helps maintain continuity in the data and allows for continued analysis or modeling.

        Forward fill is often employed when missing data is considered to be missing at random (MAR), meaning the missingness is not related to the actual value. It can be a useful technique when the missing data points are intermittent or occur sporadically.

        However, it is important to note that forward fill may not always be appropriate or suitable for all datasets or analysis scenarios. It assumes that the missing values should be carried forward, which may not be accurate or appropriate in all cases. Researchers should carefully consider the nature of the data and the implications of using forward fill before applying it.

        Alternative methods for handling missing data include backward fill (carrying the next observed value backward) or more sophisticated imputation techniques that estimate missing values based on statistical methods or predictive models. The choice of method depends on the specific characteristics of the dataset and the objectives of the analysis.

        The :term:`Trading Strategy Framework` gives you various :term:`Python` functions for forward-fill, especially for :term:`OHLCV` data. See :term:`documentation` for more info.

        See also

        - :term:`Bucket`

        - :term:`Historical market data`

        - :term:`OHLCV`

        - :term:`Dataset`

    Tactical asset allocation

        In :term:`quantitative finance`, Tactical Asset Allocation (TAA) is an investment strategy in finance that involves actively adjusting the allocation of assets within a portfolio to take advantage of short-term market opportunities or to manage risk.

        It is a dynamic approach that aims to capitalize on market inefficiencies, mispricings, or changing market conditions.

        TAA differs from strategic asset allocation, which focuses on establishing a long-term allocation mix based on the investor's goals, risk tolerance, and investment horizon. In contrast, TAA involves making short-term shifts in asset allocation based on market forecasts, economic indicators, or other relevant factors.

        The goal of tactical asset allocation is to enhance portfolio performance by overweighting or underweighting certain asset classes, sectors, or geographic regions at specific times. For example, if an investor believes that the stock market is overvalued and poised for a downturn, they may decrease their equity exposure and increase their allocation to bonds or cash. Conversely, if favorable conditions are anticipated for a particular sector or region, the investor may overweight those assets to potentially achieve higher returns.

        TAA strategies can be implemented using various techniques, including fundamental analysis, technical analysis, quantitative models, or a combination of these approaches. It requires active monitoring of market trends, economic indicators, and other relevant :term:`factors <factor investing>` that can influence asset prices. TAA may be executed through individual security selection, the use of exchange-traded funds (ETFs), or other investment vehicles.

        See also

        - :term:`Trading strategy`

        - :term:`Portfolio construction`

        - :term:`Rebalance`

        - :term:`Factor investing`

        - :term:`Alpha signal`

    Cross validation

        Cross-validation is a technique for evaluating the performance of a predictive model by testing it on a subset of data that was not used to train the model. It is a method for assessing how well the model generalizes to new data.

        Cross-validation is a common practice in machine learning and statistical modeling. It is used to assess the predictive accuracy of a model and to detect overfitting, which occurs when a model performs well on the training data but does not generalize well to new data.

        The process involves splitting the dataset into two subsets: a :term:`training set` and a :term:`test set`. The model is trained on the training set and then evaluated on the test set. The results are compared to determine how well the model performs on new data.

        Cross-validation can be used to compare different models or to tune the parameters of a model. It can also be used to select the best features for a model or to determine the optimal number of features.

        See also

        - :term:`Machine learning`

        - :term:`Statistical modeling`

        - :term:`Overfitting`

        - :term:`Training set`

        - :term:`Test set`

    Regularization

        In :term:`machine learning`, regularization is a technique for reducing overfitting by adding a penalty term to the loss function. It is a form of regression that constrains the model to prevent it from learning the training data too well.

        Regularization is a common practice in machine learning and statistical modeling. It is used to prevent overfitting, which occurs when a model performs well on the training data but does not generalize well to new data.

        The process involves adding a penalty term to the :term:`loss function` that penalizes the model for learning the training data too well. The penalty term is typically a function of the model parameters, such as the sum of the squared weights or the sum of the absolute values of the weights. The penalty term is added to the loss function to create a new loss function that is minimized during training.

        Regularization can be used to compare different models or to tune the parameters of a model. It can also be used to select the best features for a model or to determine the optimal number of features.

        See also

        - :term:`Machine learning`

        - :term:`Statistical modeling`

        - :term:`Overfitting`

        - :term:`Training set`

        - :term:`Test set`
    
    Machine learning

        Machine learning is a field of computer science that uses statistical techniques to give computer systems the ability to "learn" (i.e., progressively improve performance on a specific task) with data, without being explicitly programmed.

        Machine learning is closely related to computational statistics, which focuses on making predictions using computers. Machine learning is also sometimes conflated with data mining, which focuses on extracting useful information from large datasets.

        Machine learning algorithms are used in a wide variety of applications, including email filtering, speech recognition, and computer vision. They are also used in finance, where they are used to predict stock prices, detect fraud, and make trading decisions.

        Machine learning algorithms can be classified into two broad categories: supervised learning and unsupervised learning. Supervised learning algorithms are trained using labeled data, while unsupervised learning algorithms are trained using unlabeled data.

        Supervised learning algorithms are used to solve classification and regression problems. Classification problems involve predicting a discrete class label, while regression problems involve predicting a continuous quantity.

        Unsupervised learning algorithms are used to solve clustering and dimensionality reduction problems. Clustering problems involve grouping similar data points together, while dimensionality reduction problems involve reducing the number of features in a dataset.

        See also

        - :term:`Statistical modeling`

        - :term:`Supervised learning`

        - :term:`Unsupervised learning`

    Statistical modeling

        Statistical modeling is the process of using statistical techniques to analyze data and make predictions about future events. It is a form of regression that uses statistical methods to estimate the parameters of a model.

        Statistical modeling is a common practice in machine learning and data science. It is used to analyze data and make predictions about future events.

        The process involves fitting a statistical model to the data and then using the model to make predictions. The model is typically a mathematical function that describes the relationship between the variables in the dataset. The model is fitted to the data by estimating the parameters of the model using statistical methods.

        Statistical modeling can be used to compare different models or to tune the parameters of a model. It can also be used to select the best features for a model or to determine the optimal number of features.

        See also

        - :term:`Machine learning`

        - :term:`Supervised learning`

        - :term:`Unsupervised learning` 

    Training set

        In :term:`machine learning`, the training set is a subset of data that is used to train a model. It is a set of data that is used to fit the parameters of a model.

        The training set is typically a random sample of the dataset. It is used to train the model by minimizing the :term:`loss function`, which is a measure of how well the model fits the training data.

        The training set is used to fit the parameters of the model, while the test set is used to evaluate the performance of the model. The test set is typically a random sample of the dataset that is not used to train the model.

        See also

        - :term:`Machine learning`

        - :term:`Test set`

        - :term:`Loss function`

        - :term:`Overfitting`

    Test set

        In :term:`machine learning`, the test set is a subset of data that is used to evaluate the performance of a model. It is a set of data that is not used to train the model.

        The test set is typically a random sample of the dataset. It is used to evaluate the performance of the model by measuring its accuracy on the test set.

        The test set is used to evaluate the performance of the model, while the training set is used to fit the parameters of the model. The training set is typically a random sample of the dataset that is used to train the model.

        See also

        - :term:`Machine learning`

        - :term:`Training set`

        - :term:`Loss function`

        - :term:`Overfitting`

    Loss function

        In :term:`machine learning`, the loss function is a measure of how well a model fits the training data. It is a function that is minimized during training.

        The loss function is typically a mathematical function that measures the difference between the predicted values and the actual values. It is used to train the model by minimizing the loss function.

        The loss function is used to train the model, while the test set is used to evaluate the performance of the model. The test set is typically a random sample of the dataset that is not used to train the model.

        See also

        - :term:`Machine learning`

        - :term:`Training set`

        - :term:`Test set`

        - :term:`Overfitting`

    Supervised learning

        Supervised learning is a type of machine learning that involves training a model using labeled data. It is a form of regression that uses labeled data to train a model.

        Supervised learning is a common practice in machine learning and data science. It is used to train a model using labeled data.

        The process involves fitting a model to the data and then using the model to make predictions. The model is typically a mathematical function that describes the relationship between the variables in the dataset. The model is fitted to the data by estimating the parameters of the model using statistical methods.

        Supervised learning can be used to solve classification and regression problems. Classification problems involve predicting a discrete class label, while regression problems involve predicting a continuous quantity.

        See also

        - :term:`Machine learning`

        - :term:`Statistical modeling`

        - :term:`Unsupervised learning`

    Unsupervised learning

        Unsupervised learning is a type of machine learning that involves training a model using unlabeled data. It is a form of regression that uses unlabeled data to train a model.

        Unsupervised learning is a common practice in machine learning and data science. It is used to train a model using unlabeled data.

        The process involves fitting a model to the data and then using the model to make predictions. The model is typically a mathematical function that describes the relationship between the variables in the dataset. The model is fitted to the data by estimating the parameters of the model using statistical methods.

        Unsupervised learning can be used to solve clustering and dimensionality reduction problems. Clustering problems involve grouping similar data points together, while dimensionality reduction problems involve reducing the number of features in a dataset.

        See also

        - :term:`Machine learning`

        - :term:`Statistical modeling`

        - :term:`Supervised learning` 

    JSONL

        JSONL, also known as JSON Lines, is a convenient format for storing structured data that may be processed one record at a time. Each line in a JSONL file is a valid JSON object, allowing for simple append operations and easy processing of large files. The format is particularly useful in cases where the data consists of many small records, as it allows for line-by-line iteration, reducing memory usage when dealing with large datasets.

        This format, although not an official standard, has gained popularity due to its simplicity and efficiency in handling data. The JSONL file format is especially useful in the fields of data processing and machine learning, where dealing with large datasets is common.

        See the `JSONL specification <https://jsonlines.readthedocs.io/en/latest>`_ for more information.

        Also see an example of using JSONL with TradingStrategy data in the `JSONL example <https://tradingstrategy.ai/api/explorer/#/Trading%20pair/web_candles_jsonl>`_.

        See also

        - :term:`JSON`

        - :term:`CSV`

        - :term:`dataset`

    CSV

        CSV, or comma-separated values, is a file format that stores tabular data in plain text. It is a common format for storing data in spreadsheets and databases. It is also a common format for exchanging data between applications.

        CSV files are typically used to store data in a tabular format. Each line in a CSV file represents a row in a table, and each column in a row represents a field in the table. The fields are separated by commas, and the rows are separated by newlines.

        CSV files are often used to store data in a tabular format. They are also used to exchange data between applications.

        See also

        - :term:`JSON`

        - :term:`JSONL`
        
        - :term:`dataset`

    JSON-RPC

        In blockchain development, JSON-RPC is a popular Remote Procedure Call (RPC) protocol used by blockchain node applications.

        JSON-RPC was popularised by the original `bitcoind` node and then copied to Ethereum.
        JSON-RPC is human readable and simple protocol for programmatically asking information from your blockchain node.

        This includes

        - Querying the current state information

        - Broadcasting transactions

        JSON-RPC is used by

        - Wallets (query tokens, balances)

        - Decentralised application frontends

        You can get a JSON-RPC API for your blockchain application by

        - Self-hosting a blockchain node and then turning on the JSON-RPC API port

        - Using a software-as-a-service provider - see `ethereumnodes.com <https://ethereumnodes.com>`__ for details

        Popular alternatives for JSON-RPC includes Protobuf, as used by Cosmos SDK.

        See also

        - :term:`JSON`

        - :term:`EVM`

    Compound

        In :term:`quantitative finance`, compounding returns refer to the process of reinvesting profits or earnings generated from a :term:`trading strategy` back into the itself. It involves earning returns not only on the initial investment but also on the accumulated earnings from previous periods.

        When returns are compounded, they have the potential to grow exponentially over time, thanks to the compounding effect. The compounding effect arises from reinvesting the returns, allowing them to generate additional returns in subsequent periods. As the investment grows, the compounding effect becomes more significant, leading to accelerated growth over the long term.

        To illustrate the concept, consider an investment with an annual return of 10%. If the returns are compounded annually, the initial investment will grow by 10% each year. However, if the returns are compounded more frequently, such as quarterly or monthly, the growth rate will be higher due to the reinvestment of earnings more frequently. This compounding effect can be especially powerful when investing over long periods.

        The compounding effect is commonly observed in various investment vehicles, such as stocks, bonds, mutual funds, and other financial instruments. It is an essential concept in quantitative finance as it influences the calculation of investment performance, risk assessments, and the determination of investment strategies.

        When analyzing investment performance or projecting future returns, it is crucial to consider the impact of compounding. Investors often use compound interest formulas or specialized software to calculate and project the compounded returns based on the investment's expected growth rate and compounding frequency.

        Common :term:`benchmark` metrics that deal with compound include

        - :term:`Compound Annual Growth Rate (CAGR)`

        - :term:`Annual Percentage Yield (APY)`

        If an automated strategy does compounding it is called :term:`auto-compound` strategy.

        See also

        - :term:`Compound Annual Growth Rate (CAGR)`

        - :term:`Annual Percentage Yield (APY)`

        - :term:`Cumulative profit`

        - :term:`Risk-adjusted return`

        - :term:`Quantitative finance`

        - :ref:`Profitability calculations <profitability>`

    Position sizing

        Position sizing in :term:`quantitative finance` refers to the process of determining the appropriate size or quantity of an investment position to take in a financial instrument, such as a stock or a derivative, based on a predefined set of rules or strategies. It is a crucial aspect of portfolio management and risk control.

        The goal of position sizing is to allocate capital efficiently, taking into account factors such as risk tolerance, investment objectives, market conditions, and statistical analysis. The position size is typically determined by a combination of quantitative models, statistical techniques, and risk management principles.

        Some commonly used approaches to position sizing include:

        - *Fixed Fractional Position Sizing*: This approach involves allocating a fixed percentage of the total capital to each trade or investment. For example, a strategy might allocate 2% of the total capital to each trade, regardless of the size or risk of the trade.

        - *Kelly Criterion*: The Kelly Criterion is a mathematical formula that helps determine the optimal position size based on the probability of different outcomes and their corresponding payoffs. It aims to maximize the long-term growth rate of capital while considering the risk involved.

        - *Risk Parity*: Risk parity strategies allocate capital based on the risk contribution of each asset in the portfolio. The position size is determined by the volatility or risk of the asset, aiming for equal risk contributions from each asset class.

        - *Value-at-Risk (VaR)*: VaR is a risk management metric that estimates the maximum potential loss within a specified confidence level over a given time horizon. Position sizing based on VaR involves allocating capital in a way that limits the potential loss to a predetermined threshold.

        - *Optimization techniques*: Mathematical optimization methods can be used to find the optimal position size that maximizes a specific objective function, such as :term:`risk-adjusted returns <risk-adjusted return>` or portfolio diversification.

        See also

        - :ref:`Profitability calculations <profitability>`

        - :term:`Risk-adjusted return`

        - :term:`Quantitative finance`

        - :term:`Portfolio construction`

    Total equity


        In :term:`trading strategy`, total equity refers to all assets under the management of the strategy minus liabilities.

        In :term:`decentralised finance`, this may also be called :term:`total value locked` or *total assets*
        depending on the use case.

        Total equity is usually expressed in US dollars. For a :term:`trading strategy`, the total equity is

        - All assets, which may include

            - Cash

            - Open trading positions

        - Minus liabilities

            - Undercollateralised loans

        If a strategy is closed and all assets can be sold without :term:`price impact` and :term:`slippage`,
        each investor will get:

        `investor shares * total equity / total shares`

        :term:`Equity curve` shows how total equity has grown over time. Total equity can grow by trading profits
        and new deposits, and decrease by redemptions and trading losses.

        See also

        - :ref:`Profitability calculations <profitability>`

        - :term:`Quantitative finance`

        - :term:`Equity curve`

        - :term:`Total value locked`

    Total value locked

        In :term:`decentralised finance`, total value locked (TVL) refers to the amount of the assets
        locked in a :term:`protocol`.

        In traditional finance, the term used is Assets under management (AUM). However, because DeFi
        protocols are :term:`non-custodial` and assets are always under the management of the users themselves,
        AUM term cannot be used.

        See also

        - :term:`Protocol`

        - :term:`Total equity`

        - :term:`Netflow`

    Netflow

        In the context of :term:`trading strategy`, netflow typically refers to the net amount of money that flows into or out of a available capital over a specific period. It represents the difference between the inflows (capital deposited) and outflows (capital redeemed or withdrawn) from the fund.

        Netflow is an important metric related to :term:`total value locked` as it can effect on the trading strategy performance.

        - Positive netflows indicates that TVL is growing

        - Negative netflows indicate that more capital is being redeemed, which can reduce its TVL

        See also

        - :term:`Total value locked`

        - :term:`Total equity`

        - :term:`Trading strategy`

    Strategy age

        In :term:`trading strategy`, the age refers to the duration how long the strategy has been doing live
        trading.

        Performance metrics need enough live trading data to be available to be calculated.
        Longer the strategy has been trading, more high quality and refined its data get.

        If live trading data is not available, estimations of the strategy performance can be
        made based on :term:`backtests <backtest>`.

        See also

        - :term:`Backtest`

        - :term:`Trading strategy`

    Maximum Drawdown

        In :term:`quantitative finance`, maximum drawdown (MDD) refers to the maximum loss from a peak to a trough of a :term:`portfolio`, before a new peak is attained. It is a measure of the largest loss that an investment portfolio has experienced over a specified time period.

        Maximum drawdown is an important metric in risk management as it helps investors understand the potential downside risk of an investment. It is often used to assess the risk of a portfolio and to compare different investment strategies.

        For example, suppose an investment portfolio has a maximum drawdown of 20%. This means that the portfolio has experienced a loss of 20% from its peak value before a new peak is reached. In other words, the portfolio has lost 20% of its value at some point in the past.

        Maximum drawdown is typically expressed as a percentage of the portfolio's value. It can be calculated using the following formula:

        .. math::

            MDD = \frac{P - T}{P}

        where P is the peak value of the portfolio and T is the trough value.

        As a rule of thumb, the maximum drawdown should not be more than 1/3 of the strategy annual returns. For example, if a strategy has an annual return of 30%, the maximum drawdown should not exceed 10%.

        See also

        - :term:`Risk-adjusted return`

        - :term:`Equity curve`

        - :term:`Drawdown`

        - :term:`Risk-adjusted return`

    Take Profit

        The predetermined price level at which you plan to close out an open position for a profit. This is set when you initially establish the position. This is the price at which you want to sell and take your profit. It is important to set a take profit target and stick to it. If you don’t, you may end up holding a position for too long and lose your profit.

        This can be different to position exit that is profitable. Profitable trades that have been exited due to trailing stop loss without reaching the Take Profit limit are a different category.

        The number of 'Take Profits' may be difficult to calculate if the strategy developer has implemented their own method without using built in methods. The same goes for :term:`trailing stop loss` as well.

        See also

        - :term:`Stop-loss`

        - :term:`Trailing stop loss`

    Last trade

        In :term:`Trading Strategy Protocol`, last trade is the date when a :term:`trading strategy`
        successfully executed a trade last time.

        This metric tells who lively the underlying algorithm has been recently.

        See also

        - :term:`Trading Strategy Protocol`

    Trades last week

        In :term:`Trading Strategy Protocol`, trades last week is a metric who many successful trades
        a :term:`trading strategy` did last week.

        This metric tells who lively the underlying algorithm has been recently.

        See also

        - :term:`Trading Strategy Protocol`

    Discretionary investment management

        Discretionary management in the context of :term:`quantitative finance` refers to a trading approach where human traders have the authority to make final decisions about trade execution based on their expertise and judgment, even though algorithms and automated systems might be used to generate :ref:`trading signals <trading signal>` or suggestions.

        See also

        - :term:`Trading Strategy`

        - :term:`Technical analysis`

        - :term:`Trading signal`

        - :term:`Active strategy`    
        
    Realised profit and loss

        Realized Profit and Loss refer to the actual gains or losses incurred from the sale or closure of an investment or asset. A "realized profit" occurs when an asset is sold for a price higher than its purchase price, while a "realized loss" occurs when an asset is sold for a price lower than its purchase price. These are different from "unrealized" profits or losses, which represent potential gains or losses on assets that are still owned and have not yet been sold. Realized profits and losses are typically recorded in financial statements and are subject to taxation.

        See also

        - :term:`Unrealised profit and loss`

    Unrealised profit and loss

        Unrealized Profit and Loss refer to the theoretical gains or losses on an investment or asset that has not yet been sold or closed. These are "paper" profits or losses, meaning they exist only on paper and have not been actualized through a transaction. An "unrealized profit" occurs when the current market value of an asset is higher than its purchase price, while an "unrealized loss" occurs when the current market value is lower than the purchase price. Unlike realized profits and losses, unrealized amounts are not recorded as income or loss for tax purposes until they are realized through a sale or other transaction.

        See also

        - :term:`Realised profit and loss`

    Maximum pullback

        Maximum decrease in profitability % as a result of consecutive losing positions with respect to the portfolio's initial value. Intuitively, this can be thought of as the biggest losing streak. Not to be confused with :term:`maximum drawdown`.

        See also

        - :term:`Maximum drawdown`

    Open position

        An open position in finance and trading refers to a trade that has been initiated but has not yet been closed or settled. It represents an active market exposure that carries with it the risk of loss as well as the potential for profit. The position can be either long, indicating ownership and the expectation that the asset will appreciate in value, or short, indicating a borrowed asset that is sold with the expectation of buying it back at a lower price.

        See also

        - :term:`Unrealised profit and loss`

        - :term:`Closed position`
        
        - :term:`Longing`

        - :term:`Shorting`

    Closed position

        A closed position in finance and trading refers to a trade that has been completed by taking an action that is the opposite of the initial transaction. This means selling assets in a long position or buying back assets in a short position, thereby neutralizing the market exposure and locking in any realized gains or losses.

        - :term:`Realised profit and loss`

        - :term:`Open position`
        
        - :term:`Longing`

        - :term:`Shorting`

    Realised risk

        Realized risk refers to the actual risk that has manifested in a financial investment or trading position, leading to either a loss or lower-than-expected returns. It is the quantifiable loss or underperformance that occurs once a position is closed, as opposed to potential or "unrealized" risks that exist while a position remains open. Realized risk essentially captures how much an investor's concerns or expectations about market risk have actually materialized.

        Example: If an investor buys a stock at $100 per share and later sells it at $90, the realized risk is a 10% loss on the investment. This is an example of a risk that has been "realized" because the position is closed and the loss is confirmed.

        See also

        - :term:`Unrealised risk`

        - :term:`Market exposure`

    Unrealised risk

        Unrealized risk refers to the potential for loss or underperformance in a financial investment or trading position that has not yet been closed or settled. Unlike realized risk, which captures actual losses or gains, unrealized risk represents the possibility of future losses or gains as long as the position remains open. It quantifies the extent to which an asset or portfolio could be impacted by future market fluctuations.

        Example: If an investor owns shares of a company that have declined in value but has not yet sold those shares, the decline represents an unrealized risk. Until the investor sells the shares, the potential for loss or gain remains.

        See also

        - :term:`Realised risk`

        - :term:`Market exposure`

    Market Exposure

        Market exposure refers to the extent to which an investment portfolio is subject to fluctuations in the overall financial market or a specific asset class. It describes the amount of risk or potential for gain that an investor or organization faces as a result of having invested in a particular market, sector, or individual security.

        Example: An investor with a :term:`portfolio` heavily weighted in technology stocks has significant market exposure to the technology sector. If the technology sector performs well, the investor stands to gain; conversely, if the sector performs poorly, the investor is at risk of incurring losses.

        Unrealized risk and market exposure are often interconnected, as the level of market exposure can directly impact the degree of unrealized risk in a portfolio. A portfolio with high market exposure to volatile sectors will inherently carry a higher degree of unrealized risk until positions are closed.

        See also

        - :term:`Unrealised risk`

        - :term:`Risk-adjusted return`

        - :term:`Portfolio construction`

        - :term:`Trading strategy`

    Median

        The median is a measure of central tendency that separates a data set into two equal halves. It is the middle value when all data points are arranged in ascending or descending order. In the case of an even number of observations, the median is the average of the two middle numbers.

        Example: For the data set [1, 3, 3, 6, 7, 8, 9], the median is 6. If the data set were [1, 3, 3, 6, 7, 8], the median would be (3+6)/2 = 4.5

        Usage: The median is often used in statistical analyses to provide a measure of the "typical" value in a distribution, particularly when the data set may contain outliers that could heavily influence the mean. It is also used to calculate the median absolute deviation (MAD), which is a measure of dispersion that is less sensitive to outliers than the standard deviation.

        See also

        - :term:`Mean`

        - :term:`Standard deviation`

        - :term:`Variance`

    Mean

        The mean is a measure of central tendency that represents the average value of a data set. It is calculated by dividing the sum of all values by the number of values in the data set. It is also known as the arithmetic mean or average.

        Example: For the data set [1, 3, 3, 6, 7, 8, 9], the mean is (1+3+3+6+7+8+9)/7 = 5.14

        Usage: The average is widely used in various fields for summarizing data sets, comparing different groups, or tracking changes over time. However, it can be susceptible to the influence of outliers.

        See also

        - :term:`Median`

        - :term:`Standard deviation`

        - :term:`Variance`

    
    Standard Deviation
        
        Standard deviation is a statistical measure that quantifies the dispersion or variability of a data set around its mean (average). In finance and investment, standard deviation is often used as an indicator of risk or volatility. A higher standard deviation indicates greater variability in the data set or more volatility in a financial asset, while a lower standard deviation indicates less variability or lower volatility.

        Example: For the data set [1, 3, 3, 6, 7, 8, 9], the standard deviation is 2.92

        Usage: In financial markets, standard deviation is commonly used as a measure of an asset's volatility, which helps investors and traders understand the asset's risk profile. A higher standard deviation implies more unpredictability in price movement, signaling higher risk, while a lower standard deviation indicates less risk and more stable returns.

        Standard deviation and volatility are closely related concepts, especially in the context of finance. Volatility is essentially a practical application of standard deviation, often used to gauge the risk associated with different financial instruments.

        See also

        - :term:`Mean`

        - :term:`Median`

        - :term:`Variance`

    
    Variance
    
        Variance is a statistical measure that represents the spread or dispersion of a set of data points around their mean (average). It quantifies how far each data point in the set is from the mean and, consequently, from every other data point in the set. In finance, variance is often used as a measure of risk or volatility, although it is less commonly used than its square root, the standard deviation.

        Usage: Variance is used in various fields, including statistics, finance, and engineering, to quantify variability or dispersion. In finance, it serves as a measure of an asset's risk. However, standard deviation is more commonly used for this purpose because it is in the same unit as the data, making it more interpretable.

        Variance is the square of the standard deviation, and both are used to measure the volatility or risk associated with a financial asset. However, standard deviation is generally preferred in practical applications because it is in the same unit as the original data points.

        See also

        - :term:`Mean`

        - :term:`Median`

        - :term:`Standard deviation`

        - :term:`Volatility`

    Volume
        
        In the context of cryptocurrency, trading volume refers to the total number of tokens or coins that have been traded for a specific cryptocurrency pair within a given time frame. It serves as a key indicator of the asset's liquidity and the level of investor interest. High trading volumes often suggest a more liquid and stable market, while low volumes may indicate less liquidity and greater potential for price manipulation.

        Example: If the trading volume for the Bitcoin/USD pair is 50,000 BTC, it means that 50,000 Bitcoins have been traded against the US dollar during the specified time frame.

        Usage: Trading volume is a crucial metric for traders, analysts, and investors in the cryptocurrency market. It provides insights into market sentiment, liquidity, and potential volatility. High trading volume is generally seen as a sign of market strength and can be a good indicator for entry or exit points. Conversely, low trading volume may indicate a lack of interest or uncertainty.

        The trading volume in the cryptocurrency market is often used alongside other metrics and indicators to form a more comprehensive view of market conditions.

        See also

        - :term:`Liquidity`

        - :term:`Market sentiment`

        - :term:`Order book`

        - :term:`Bid-ask spread`

        - :term:`Volatility`

    
    Market Sentiment

        Market sentiment refers to the overall attitude or tone of investors toward a particular financial market or asset. It is often gauged through various indicators such as price movements, trading volume, news, and other market activities. Market sentiment can be bullish (optimistic), bearish (pessimistic), or neutral.

        Example: If most news articles about a particular stock are positive and its trading volume is high, the market sentiment is likely to be bullish.

        Usage: Market sentiment is closely monitored by traders and investors as it can influence price trends and market volatility. Understanding market sentiment can help in making more informed investment decisions.

        See also

        - :term:`Volume`

        - :term:`Market exposure`

        - :term:`Volatility`

        - :term:`Technical analysis`

    Bid-Ask Spread

        The bid-ask spread is the difference between the highest price a buyer is willing to pay for an asset (the bid) and the lowest price at which a seller is willing to sell (the ask). It serves as a measure of the asset's liquidity and is a cost that traders have to consider when entering and exiting positions.

        Example: If the bid price for a stock is $50 and the ask price is $51, the bid-ask spread is $1.

        Usage: The bid-ask spread is important for traders and investors as a narrower spread generally indicates higher liquidity and lower transaction costs, while a wider spread can signify the opposite.

        See also

        - :term:`Liquidity`

        - :term:`Volume`

        - :term:`Market order`

        - :term:`Limit order`

    Volatility

        In :term:`quantitative finance`, volatility refers to the degree of variation or fluctuation in the price of a financial asset over a certain period of time. It is often measured by statistical metrics like standard deviation or historical price changes. Higher volatility indicates a greater potential for rapid price changes, while lower volatility suggests more stable pricing.

        Example: If a cryptocurrency experiences rapid price swings within short periods, it is said to have high volatility.

        Volatility is a crucial concept in financial markets, often used by traders and investors to assess the risk and potential returns of an asset. High volatility can offer opportunities for greater returns but also poses higher risks.

        Each of these terms offers a different lens through which to analyze market conditions and can be used in combination to make more informed trading or investing decisions.

        When :term:`benchmarking <benchmark>` different :term:`portfolios <portfolio>` for :term:`Risk-adjusted return`, volatility is the fundamental
        metric for various risk vs. rewards calculations.

        :term:`Delta neutral` :term:`trading strategy` is a strategy that is immune to volatility: no matter which direction the price
        moves, the strategy makes profit.

        See also

        - :term:`Standard deviation`

        - :term:`Market sentiment`

        - :term:`Volume`

        - :term:`Variance`

        - :term:`Trading strategy`

        - :term:`Risk-adjusted return`

        - :term:`Delta neutral`

    Compound Annual Growth Rate (CAGR)

        CAGR, or Compound Annual Growth Rate, is a financial metric that measures the average annual growth rate of an investment over a specified period of time, typically longer than one year. It provides a smoothed-out view of an investment’s performance by accounting for compounding effects. In :term:`quantitative finance`, CAGR is used to compare performance of different portfolios. CAGR does not account for investment risk.

        Here’s how to calculate CAGR:

        - Beginning Value (BV): Determine the value of the investment at the start of the period.
        - Ending Value (EV): Find the value of the investment at the end of the same period.
        - Number of Years (n): Calculate the total number of years in the investment period.
        - Divide the ending value by the beginning value.
        - Raise the result to an exponent of one divided by the number of years.
        - Subtract one from the subsequent result.
        - Multiply by 100 to express the answer as a percentage.

        The CAGR represents the hypothetical constant annual growth rate that would lead to the same final value if the investment grew at that rate every year and profits were reinvested annually. It’s important to note that this smooths out variations in returns and provides a more easily understandable comparison across different investments.

        For example, let’s say you invested $10,000 in a portfolio with the following returns:

            From Jan. 1, 2018, to Jan. 1, 2019: Portfolio grew to $13,000 (30% in year one).
            From Jan. 1, 2019, to Jan. 1, 2020: Portfolio was $14,000 (7.69% growth).
            From Jan. 1, 2020, to Jan. 1, 2021: Portfolio ended at $19,000 (35.71% growth).

        While the annual growth rates varied significantly, the CAGR over the entire period would be approximately 23.86%1.

        See also

        - :term:`Cumulative profit`

        - :term:`Risk-adjusted return`

        - :term:`Quantitative finance`

        - :term:`Maximum drawdown`

        - :term:`Sharpe`

        - :term:`Sortino`

        - :term:`Annual Percentage Rate (APR)`

        - :term:`Annual Percentage Yield (APY)`

        - :term:`Trading strategy`

    CAGR

        See :term:`Compound Annual Growth Rate (CAGR)`.

    Time in Market

        "Time in Market" refers to the duration for which a :term:`trading strategy` or an algorithm maintains positions in the market. In algorithmic trading, strategies are often designed to exploit short-term market inefficiencies or trends, and the duration for which they hold positions can vary significantly.

        For example, some algorithmic trading strategies may execute trades within microseconds or milliseconds, aiming to capitalize on very short-term price movements. These strategies have a minimal "time in market" as they quickly enter and exit positions. On the other hand, some strategies may hold positions for longer durations, ranging from minutes to hours or even days. These strategies rely on capturing larger market trends or exploiting fundamental factors that may take time to unfold. They have a longer "time in market" compared to high-frequency trading strategies.

        Time in Market can be also percents expressing how long the strategy hold any position open vs. just having cash. For example 30% Time in Market means that the strategy hold the underlying assets for 30% of its life time, and was all cash 70% of the time.

        Usually Time in Market also correlates with the position count: if the time in market is low, it means strategy is opening positions less frequently.

        See also

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Risk-adjusted return`

    Delta neutral

        In :term:`quantitative finance`, a delta neutral :term:`trading strategy` is not exposed to the :term:`volatility` of underlying assets.

        A delta neutral strategy, also known as :term:`market neutral strategy` does not make any losses regardless if asset prices more up or down.

        See also

        - :term:`Market neutral strategy`

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Risk-adjusted return`

        - :term:`Volatility`

    Annual Percentage Rate (APR)

        APR stands for Annual Percentage Rate in :term:`quantitative finance`. It is a standardized way of expressing the cost of borrowing money or the return on investment over a yearly basis. In quantitative finance, APR is commonly used in various financial instruments such as loans, mortgages, credit cards, and investment products.

        In trading :term:`Compound Annual Growth Rate (CAGR)` is more commonly used. APR is used for loans, :term:`delta neutral` trading strategies
        and :term:`yield farming` in :term:`decentralised finance`.

        APR does not account compounding interest, unlike :term:`:term:`Annual Percentage Yield (APY)`.

        See also

        - :term:`Annual Percentage Yield (APY)`

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Compound Annual Growth Rate (CAGR)`

        - :term:`Risk-adjusted return`

    APR

        See :term:`Annual Percentage Rate (APR)`

    Annual Percentage Yield (APY)

        APY stands for Annual Percentage Yield in :term:`quantitative finance`. It is a measure used to represent the effective annual rate of return or the annualized rate of interest earned on an investment or deposit, taking into account the effect of compounding interest.

        Unlike :term:`APR (Annual Percentage Rate)`, which only considers the nominal interest rate, APY factors in the compounding frequency of interest payments. This means that APY reflects the total amount of interest earned or paid over a year, including the effect of reinvesting interest earnings or paying interest on previously earned interest.

        APY is particularly useful for comparing the true returns of different investment or deposit options, as it provides a standardized way of expressing the annualized rate of return while accounting for compounding. It allows investors to make more informed decisions about where to allocate their funds based on the actual returns they can expect to earn.

        In trading :term:`Compound Annual Growth Rate (CAGR)` is more commonly used. APY is used for loans, :term:`delta neutral` trading strategies
        and :term:`yield farming` in :term:`decentralised finance`.

        See also

        - :term:`Annual Percentage Rate (APR)`

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Compound Annual Growth Rate (CAGR)`

        - :term:`Risk-adjusted return`
    APY

        See :term:`Annual Percentage Yield (APY)`

    Alpha

        In :term:`quantitative finance`, "alpha" refers to a measure of an investment strategy's performance compared to a benchmark index, after adjusting for risk. It represents the excess return generated by the strategy beyond what would be expected based on its level of risk. Alpha is often used to assess the skill or effectiveness of portfolio managers, traders, or investment strategies in generating returns.

        Mathematically, alpha is typically calculated using the Capital Asset Pricing Model (CAPM) or similar models that relate an asset's return to its level of risk. In these models, alpha is the intercept term of the regression equation, representing the excess return not explained by the systematic risk factors.

        Positive alpha indicates that the :term:`trading strategy` has outperformed the benchmark, while negative alpha suggests underperformance.

        Alpha is a crucial concept in quantitative finance, as it helps investors evaluate the effectiveness of their investment decisions and identify sources of added value beyond market movements.

        See also

        - :term:`Alpha model`

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Risk-adjusted return`

        - :term:`Alpha generation platform`

        - :term:`Profitability`

        - :term:`Strategy decay`

    Strategy decay

        In :term:`quantitative finance`, strategy decay means that a :term:`trading strategy` loses is excessive profit, or :term:`alpha` generation, capabilities over time.

        `From QuantStrat <https://www.quantstart.com/articles/annualised-rolling-sharpe-ratio-in-qstrader/>`__:

        "Strategy decay is one of the trickiest aspects to manage within the realm of quantitative trading. It involves previously performing strategies that gradually, and sometimes rapidly, lose their performance characteristics and end up becoming unprofitable."

        "Quantitative trading strategies almost unilaterally rely on the concept of forecasting and/or statistical mispricing. As more and more trading entities–retail or institutional–implement similar systematic strategies the mispricings give way to price efficiency. The gain derived from such strategies is eroded and then usually falls to the level of transaction costs required to carry it out, making them unprofitable."

        "This means that quantitative trading is not a "set and forget" activity. In reality quant traders need to have a portfolio of strategies that are slowly rotated out over time once any arbitrage opportunities begin to erode. Thus constant research is required to continually develop new profitable edges that replace those that have been arbed away".

        One common way to measure and visualise strategy decay is visualising rolling :term:`Sharpe` ratio.
        If Sharpe is getting worse over time, the strategy is decaying.

        See also

        - :term:`Sharpe`

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Alpha`

        - :term:`Sharpe`

        - :term:`Risk-adjusted return`

        - :term:`Profitability`

        - :term:`Best trading strategy`

    Excess returns

        See :term:`alpha`.

    Market regime

        In :term:`quantitative finance`, market regime means the current general state of the market. It can concern a single :term:`trading pair`,
        of the market as a whole.

        Popular market regimes includes

        - :term:`Bull market` - everything goes up

        - :term:`Bear market` - everything comes down

        - Crab market - everything moves sideways

        Market regime can be also volatility based, for the risk management

        - High volatility - avoid trend following strategies, as trend is unclear

        - Low volatility - breakouts are less likely, avoid breakout strategies

        See also

        - :term:`Regime filter`

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Risk-adjusted return`

    Regime filter

        In a :term:`trading strategy`, a regime filter tells the current :term:`market regime`.

        The strategy should modify its behavior based on the direction of the markets

        - In a :term:`bull market` make more aggressive bets

        - In a :term:`bear market` - conserve cash and open more short positions

        Some regime filters are

        - Bitcoin 200-days :term:`moving average` - if we are above 200 days moving average cryptocurrencies are in a bull market

        - Machine learning based clustering

        Market regime filter examples

        - `Market Regime Detection using Hidden Markov Models in QSTrader <https://www.quantstart.com/articles/market-regime-detection-using-hidden-markov-models-in-qstrader/>`__

        See also

        - :term:`Market regime`

        - :term:`Trading strategy`

        - :term:`Quantitative finance`

        - :term:`Risk-adjusted return`

        - :term:`Best trading strategy`

    Benchmark

        In :term:`quantitative finance`, benchmarking is comparing different :term:`portfolios <portfolio>`
        or :term:`trading strategies <trading strategy>` against each other.

        The comparison examines

        - :term:`Cumulative profit`

        - :term:`Risk-adjusted return`

        - Fees paid or generated

        Common comparison methods include

        - :term:`Compound Annual Growth Rate (CAGR)`, or :term:`cumulative profit`

        - :term:`Equity curve` comparison

        - :term:`Volatility` risk-based and risk-adjusted metrics like :term:`Sharpe` and :term:`Sortino` ratios

        Benchmark can compare

        - Different :term:`trading stragies <trading strategy>` to each other

        - Different :term:`portfolios <portfolio>` to each other

        - Strategies and portfolios to a :term:`trading pair` :term:`buy and hold` performance

        See also

        - :term:`Trading strategy`

        - :term:`Portfolio`

        - :term:`Quantitative finance`

        - :term:`Risk-adjusted return`

        - :term:`Buy and hold`

        - :term:`Best trading strategy`

    Buy and hold

        In :term:`quantitative finance`, a buy and hold trading strategy is to buy an asset
        and not sell it ever, or for a long period of time.

        In cryptocurrency trading, this kind of :term:`trading strategy` is called "diamond hands."

        The benefit of this kind of strategy is that you are not paying any trading fees.
        Holding an asset is usually free.

        Even if you never sell the asset, you can use it as collateral and borrow money against it.

        On of the most famous diamon hands are Michael Saylor and his company MicroStrategy that are
        only buying more and more bitcoin since 2019.

        See also

        - :term:`Trading strategy`

        - :term:`Portfolio`

        - :term:`Quantitative finance`

        - :term:`Risk-adjusted return`

        - :term:`Benchmark`

        - :term:`Best trading strategy`
