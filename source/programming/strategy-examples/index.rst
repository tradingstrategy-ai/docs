.. _strategy examples:

.. meta::
   :description: Trading Strategy example Jupyter notebooks


Strategy examples
=================

Here you can find trading strategy examples as :term:`Jupyter notebooks <Jupyter notebook>`.

- The examples show how to use Trading Strategy framework for algorithmic trading
- Some notebooks are examples of complete strategies
- Some notebooks highlight a particular feature
- These examples also include backtests that you can run yourself.
- You can copy these files, run and and start editing them to suit your needs.
- Refer to the `Tags`_ section to see all the tags associated with each notebook

Prerequisites
-------------

- Refer to :ref:`running backtests <running-backtests>` to see how to set up your development environment and run the notebooks 
- If you are new to algorithmic trading we recommend you check :ref:`the basic code examples <tutorial>` first.

.. raw:: html

      <style type="text/css">
            .tg {
                  border-collapse: collapse;
                  border-spacing: 0;
            }

            .tg td {
                  border-color: black;
                  border-style: solid;
                  border-width: 1px;
                  font-family: Arial, sans-serif;
                  font-size: 15px;
                  overflow: hidden;
                  padding: 10px 5px;
                  word-break: normal;
            }

            .tg th {
                  border-color: black;
                  border-style: solid;
                  border-width: 1px;
                  font-family: Arial, sans-serif;
                  font-size: 15px;
                  font-weight: normal;
                  overflow: hidden;
                  padding: 10px 5px;
                  word-break: normal;
            }

            .tg .tg-0pky {
                  border-color: inherit;
                  text-align: left;
                  vertical-align: top
            }
      </style>

      <h2>Get started</h2>
      <table class="tg">
      <thead>
            <tr>
                  <th class="tg-0pky">Notebook</th>
                  <th class="tg-0pky">Description</th>
            </tr>
      </thead>
      <tbody>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/pancakeswap-ema.html">pancakeswap-ema</a>
                  </td>
                  <td class="tg-0pky">Explore a basic example of Exponential Moving Average (EMA) strategy on PancakeSwap. This notebook is perfect for beginners to learn trend-analysis establish a trading foundation.</td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/pancakeswap-ema-stop-loss.html">pancakswap-ema-stop-loss</a>
                  </td>
                  <td class="tg-0pky">Discover how to create and run backtests with a stop-loss parameter. This example can help you learn about basic risk management to prevent substantial losses.</td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/osmosis.html">osmosis</a></td>
                  <td class="tg-0pky">Study an example of creating your own synthetic data. This way, you can simulate any market condition you want as a stress test for your strategy.  
                  </td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a href="">bollinger-band-strategy</a></td>
                  <td class="tg-0pky">Learn how to convert a PineScript strategy into our own TradingStrategy framework. This notebook uses introduces an indicator called the Bollinger Band in a way that is suitable for beginners.</td>
            </tr>
      </tbody>
      </table>

      <h2>Advanced</h2>
      <table class="tg">
      <thead>
            <tr>
                  <th class="tg-0pky">Notebook</th>
                  <th class="tg-0pky">Description</th>
            </tr>
      </thead>
      <tbody>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/portfolio-construction-model.html">portfolio-construction-model</a>
                  </td>
                  <td class="tg-0pky">Dive deep into the construction of a momentum-based portfolio. This advanced strategy will show you how to work with a portfolio of assets and improve your understanding of market momentum, which can be a crucial factor in successful trading.
                  </td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/trader-joe-momentum.html">trader-joe-momentum</a>
                  </td>
                  <td class="tg-0pky">Another example on the construction of a momentum-based portfolio of multiple assets. It uses a simple moving average (SMA) and will also hone your skills in trend analysis.</td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/grid-search.html">grid-search</a>
                  </td>
                  <td class="tg-0pky">Experiment with a grid search example that experiments with different variations of the Bollinger bands strategy shown in the 'Get Started' section. This notebook will enhance your understanding of hyperparameter tuning, essential for optimizing your trading strategies and also demonstrates mean reversion by combining the use of Bollinger Bands and RSI indicators. </td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/momentum-crossover.html">momentum-crossover</a>
                  </td>
                  <td class="tg-0pky">Investigate more complex buy/sell signals with crossovers and crossunders. This advanced example is beneficial for those seeking to employ nuanced trade signals in their trading strategies.
                  </td>
            </tr>
      </tbody>
      </table>
      
      <h2>More examples</h2>
      <table class="tg">
      <thead>
            <tr>
                  <th class="tg-0pky">Notebook</th>
                  <th class="tg-0pky">Description</th>
            </tr>
      </thead>
      <tbody>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/synthetic-ema.html">synthetic-ema</a>
                  </td>
                  <td class="tg-0pky">Demonstrates a basic EMA example using synthetic data. Gain a better understanding of EMA application on artificial data for prototyping and testing new trading ideas and strategies.</td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/synthetic-ema-stop-loss.html">synthetic-ema-stop-loss</a>
                  </td>
                  <td class="tg-0pky">Master the use of stop-loss in an EMA strategy using synthetic data. This example will improve your skills in risk management and in the application of algorithmic trading techniques on artificial data.</td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/hackatom-2022-osmosis-backtest.html">hackatom-2022-osmosis-backtest</a>
                  </td>
                  <td class="tg-0pky">Examine synthetic data analysis again with the Hackatom-2022 Osmosis backtest. This notebook places more emphasis on creating and analyzing your synthetic data, and explains how to create data for different market trends and volatilities.</td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/backtest-fee-analysis.html">backtest-fee-analysis</a>
                  </td>
                  <td class="tg-0pky">An example of creating a strategy on synthetic data with a fixed price. This allows us to focus solely on the trading fees paid for each transaction.</td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/examine-live-strategy.html">examine-live-strategy</a>
                  </td>
                  <td class="tg-0pky">Examine a live trading strategy using summary statistics and visuals. This is a great way to learn how to evaluate strategy performance in real-time, an essential skill for algorithmic trading.</td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/debugging-live-strategy.html">debugging-live-strategy</a>
                  </td>
                  <td class="tg-0pky">Learn to debug unsuccessful trades in a live trading strategy. This knowledge will help you identify and correct potential issues in your strategies, improving your trading success rate.</td>
            </tr>
      </tbody>
      </table>
      <h2>Deprecated</h2>
      <table class="tg">
      <thead>
            <tr>
                  <th class="tg-0pky">Notebook</th>
                  <th class="tg-0pky">Description</th>
            </tr>
      </thead>
      <tbody>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/pancake-eth-usd-indicators.html">pancake-eth-usd-indicators</a>
                  </td>
                  <td class="tg-0pky">Explore the application of detached technical indicators on PancakeSwap's ETH-USD pair. Even though it's currently deprecated, it is only because the crossover visuals are not accurate (which is currently being investigated), but all the other code is still valid. This notebook is a great way to learn how to use detached indicators in your trading strategies.
                  </td>
            </tr>
            <tr>
                  <td class="tg-0pky"><a
                        href="https://tradingstrategy.ai/docs/programming/strategy-examples/strategy-backtest-template.html">strategy-backtest-template</a>
                  </td>
                  <td class="tg-0pky">Get familiar with an old backtesting template. Despite its deprecated status, understanding the evolution of backtesting templates can provide insights into the improvements made over time.</td>
            </tr>
      </tbody>
      </table>


Tags
-------------

.. toctree::
   :maxdepth: 2
   :titlesonly:

   ../../_tags/tagsindex
