.. meta::
   :description: Blog posts and articles about algorithmic trading.

Blog posts about algorithmic trading
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section contains various blog posts and articles related to algorithmic trading, quantitative finance, and systematic strategies.

.. note::

    For academic research papers, see the :doc:`Papers section <./papers>`.
    For AI and machine learning topics, see the :doc:`AI section <./ai-and-machine-learning>`.

How to avoid overfitting trading strategies
-------------------------------------------

Running a lossy trading strategy would be a very costly mistake, so we spend a lot of effort on assessing the expected performance of our strategies. This task gets harder when we have limited data for this evaluation or when we experiment with the strategy for a longer time and risk manually overfitting the strategy on the same out-of-sample data.

`Read the Quantlane blog post <https://quantlane.com/blog/avoid-overfitting-trading-strategies/>`__.

A Trend Following Framework for Gold, Bitcoin, and Nasdaq
---------------------------------------------------------

A practical framework for systematic trend following across Gold, Nasdaq, and Bitcoin futures. The approach combines a Donchian Channel for trend detection with a Chandelier Stop for risk management. Key components include: volatility-targeted position sizing (risking 2% of equity per trade with stops at 3x ATR), a two-stage exit mechanism using both protective trailing stops and technical exits based on lowest low breakdowns.

The system targets "fat tails" while keeping maximum drawdown to -15%. With a 47% win rate but favorable risk/reward (average win 4.30% vs average loss 2.06%), the framework emphasizes that systematic execution beats emotional guessing. Assets are chosen for their high volatility, strong trends, and low correlation.

By Petr Podhajsky. Tools used: RealTest & Norgate Data.

`Read the post <https://www.linkedin.com/posts/petr-podhajsky_terrified-of-buying-the-top-in-gold-bitcoin-ugcPost-7424474305478000640-bV86/>`__

Why Mean-Variance Optimization Breaks Down
------------------------------------------

Mean-Variance Optimization (MVO) is a central framework for portfolio construction, yet practitioners quickly encounter a paradox: the mathematically "optimal" portfolio built from estimated inputs is often unstable, highly leveraged, and disappoints out-of-sample. This is not a minor implementation detail—it is a structural consequence of combining a high-dimensional optimizer with noisy estimates of expected returns and covariances.

This article develops MVO from first principles and explains, in a mathematically explicit way, why raw MVO tends to maximize estimation error. It surveys the spectrum of practical fixes organized around two levers: improving or regularizing the inputs (expected returns and covariances), and constraining or regularizing the optimizer (the feasible set and objective). The unifying theme is that almost every successful fix works by injecting bias in exchange for a large reduction in variance of the resulting portfolio weights.

By VertoxQuant.

`Read the post <https://www.vertoxquant.com/p/why-mean-variance-optimization-breaks>`__
