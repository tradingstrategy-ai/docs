Velvet portfolio deployment
===========================

Here are specific instructions to deploy a vault with :term:`Velvet Capital`.
The instructions have only Velvet specific bits. For full guide see :ref:`vault deployment`.

Preface
-------

An automated trading Velvet vault consists of

- Safe multisig wallet
- Velvet Capital proprietary vault contracts for the share token and deposit flow management
- Special integrations for whitelisted trading protocols like Enso

Velvet deployment
-----------------

1. Create a new private key for the oracle
2. Import this private key to Metamask or Rabby
3. Go to Velvet website
4. Manually create a portfolio
5. Configure vault based on this private key and portfolio contract address
6. Top up vault with some USDT/USDC

Example Velvet configuration
----------------------------

Example env file for trade-executor Docker:

.. code-block:: shell

    #
    # This is the public environment variables file for a trade executor.
    # This is only partial configuration.
    #

    # This is a vault based strategy
    ASSET_MANAGEMENT_MODE="velvet"

    #
    # Strategy assets and metadata
    #

    STRATEGY_FILE=strategy/bnb-ath.py

    # Port 3456 is mapped to the public IP on the host using Caddy
    HTTP_ENABLED=true

    # The trigger mode for the decide_trades()
    MIN_GAS_BALANCE=0.01
    GAS_BALANCE_WARNING_LEVEL=0.03

    # mainly for TVL data since we have only daily candles
    MAX_DATA_DELAY_MINUTES=1600

    # Vault
    # https://dapp.velvet.capital/ManagerVaultDetails/0x806b760f99ce80fa01bf9b3a8de6dd3590d4d1a9
    VAULT_ADDRESS=0x806b760f99ce80fa01bf9b3a8de6dd3590d4d1a9

Preflight sequence
------------------

See :ref:`vault-deployment` for full details.

1. Manually create vault
2. Deploy env file
3. Update docker-compose.yml
4. Update Caddy
5. `trade-executor init`
6. `trade-executor check-universe`
7. `trade-executor check-wallet`
8. `trade-executor perform-test-trade --simulate`
9. `trade-executor perform-test-trade --no-simulate`
10. Adjust strategy parameter thresholds for low launch capital amounts
11. `trade-executor start`



