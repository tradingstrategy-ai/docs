.. _strategy examples:

.. meta::
   :description: Trading Strategy example Jupyter notebooks


Strategy examples
=================

Here you can find trading strategy examples as notebooks.

- The examples show how to use Trading Strategy framework for algorithmic trading

- Some notebooks are complete example strategies

- Some notebooks highlight a particular feature

- Trading strategy examples are backtests you can run yourself.
  Strategy backtests are in the form of :term:`Jupyter notebooks <Jupyter notebook>`.

- You can copy these files, run and and start editing them yourself.
  See :ref:`running backtests <running-backtests>` on how you can to run.


Notebook overview
-----------------

The following table presents the tags for each notebook. See the section below for links to the notebooks. 

.. raw:: html

   <style type="text/css">
   .tg  {border-collapse:collapse;border-spacing:0;}
   .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
   overflow:hidden;padding:10px 5px;word-break:normal;}
   .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
   font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
   .tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
   </style>
   
   <h2>Get started</h2>
   <table class="tg">
      <thead>
         <tr>
               <th class="tg-0pky">Notebook</th>
               <th class="tg-0pky">Description</th>
               <th class="tg-0pky">Tags</th>
         </tr>
      </thead>
      <tbody>
         <tr>
               <td class="tg-0pky">pancakeswap-ema</td>
               <td class="tg-0pky">Basic example of EMA</td>
               <td class="tg-0pky">ema, trend-analysis, get-started</td>
         </tr>
         <tr>
               <td class="tg-0pky">pancakswap-ema-stop-loss</td>
               <td class="tg-0pky">How to create and run backtests where stop loss is being used</td>
               <td class="tg-0pky">stop-loss, ema, trend-analysis, get-started</td>
         </tr>
         <tr>
               <td class="tg-0pky">osmosis</td>
               <td class="tg-0pky">Synthetic EMA example</td>
               <td class="tg-0pky">ema, trend-analysis, synthetic-data</td>
         </tr>
         <tr>
               <td class="tg-0pky">bollinger-band-strategy</td>
               <td class="tg-0pky">PineScript strategy conversion example.</td>
               <td class="tg-0pky">get-started, bollinger-bands, rsi, stop-loss, mean-reversion</td>
         </tr>
      </tbody>
   </table>

   <h2>Advanced</h2>
   <table class="tg">
      <thead>
         <tr>
               <th class="tg-0pky">Notebook</th>
               <th class="tg-0pky">Description</th>
               <th class="tg-0pky">Tags</th>
         </tr>
      </thead>
      <tbody>
         <tr>
               <td class="tg-0pky">portfolio-construction-model</td>
               <td class="tg-0pky">Construct a momentum based portfolio construction strategy</td>
               <td class="tg-0pky">alpha-model, advanced, momentum, stop-loss</td>
         </tr>
         <tr>
               <td class="tg-0pky">trader-joe-momentum</td>
               <td class="tg-0pky">Construct a momentum based portfolio construction strategy</td>
               <td class="tg-0pky">advanced, multipair, alpha-model, trend-analysis, stop-loss, sma</td>
         </tr>
         <tr>
               <td class="tg-0pky">grid-search</td>
               <td class="tg-0pky">Grid search example that modifies the default Bollinger bands example</td>
               <td class="tg-0pky">mean-reversion, advanced, grid-search, stop-loss, bollinger-bands, rsi</td>
         </tr>
         <tr>
               <td class="tg-0pky">momentum-crossover</td>
               <td class="tg-0pky">More complex buy/sell signals with crossovers and crossunders</td>
               <td class="tg-0pky">momentum, advanced, stop-loss, ema, rsi</td>
         </tr>
      </tbody>
   </table>

   <h2>More examples</h2>
   <table class="tg">
      <thead>
         <tr>
               <th class="tg-0pky">Notebook</th>
               <th class="tg-0pky">Description</th>
               <th class="tg-0pky">Tags</th>
         </tr>
      </thead>
      <tbody>
         <tr>
               <td class="tg-0pky">synthetic-ema</td>
               <td class="tg-0pky">Also basic EMA example, but uses synthetic data. </td>
               <td class="tg-0pky">synthetic-data, get-started, ema, trend-analysis</td>
         </tr>
         <tr>
               <td class="tg-0pky">synthetic-ema-stop-loss</td>
               <td class="tg-0pky">Synthetic EMA example that uses stop loss</td>
               <td class="tg-0pky">synthetic-data, get-started, ema, trend-analysis, stop-loss</td>
         </tr>
         <tr>
               <td class="tg-0pky">hackatom-2022-osmosis-backtest</td>
               <td class="tg-0pky">More focus on sythetic data analysis.</td>
               <td class="tg-0pky">synthetic-data, ema, trend-analysis</td>
         </tr>
         <tr>
               <td class="tg-0pky">backtest-fee-analysis</td>
               <td class="tg-0pky">How different fee models can be implemented in backtesting.</td>
               <td class="tg-0pky">fee-analysis, synthetic-data</td>
         </tr>
         <tr>
               <td class="tg-0pky">examine-live-strategy</td>
               <td class="tg-0pky">Examine live trading strategy with summary stats and visuals</td>
               <td class="tg-0pky">live-strategy</td>
         </tr>
         <tr>
               <td class="tg-0pky">debugging-live-strategy</td>
               <td class="tg-0pky">Debug unsuccessful trades</td>
               <td class="tg-0pky">live-strategy, debugging</td>
         </tr>
      </tbody>
   </table>

   <h2>Deprecated</h2>
   <table class="tg">
      <thead>
         <tr>
               <th class="tg-0pky">Notebook</th>
               <th class="tg-0pky">Description</th>
               <th class="tg-0pky">Tags</th>
         </tr>
      </thead>
      <tbody>
         <tr>
               <td class="tg-0pky">pancake-eth-usd-indicators</td>
               <td class="tg-0pky">Application of detached technical indicators</td>
               <td class="tg-0pky">stop-loss, ema, trend-analysis, get-started, old</td>
         </tr>
         <tr>
               <td class="tg-0pky">strategy-backtest-template</td>
               <td class="tg-0pky">Old backtesting template</td>
               <td class="tg-0pky">template, old</td>
         </tr>
      </tbody>
   </table>


Example backtesting Jupyter notebooks
-------------------------------------

.. toctree::
   :maxdepth: 1

   running
   pancakeswap-ema
   pancakeswap-ema-stop-loss
   pancake-eth-usd-indicators
   portfolio-construction-model
   trader-joe-momentum
   bollinger-band-strategy
   grid-search   
   synthetic-ema
   synthetic-ema-stop-loss
   backtest-fee-analysis
   examine-live-strategy
   debugging-live-strategy
   osmosis
   strategy-backtest-template
   momentum-crossover
   hackatom-2022-osmosis-backtest


More basic code examples
------------------------

If you are new to algorithmic trading we recommend you check :ref:`the basic code examples <tutorial>` first.


Notebook tags
-------------

.. toctree::
   :maxdepth: 2
   :titlesonly:

   ../../_tags/tagsindex
