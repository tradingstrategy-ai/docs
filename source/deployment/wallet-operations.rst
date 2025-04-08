Vault manual transactions
=========================

In this chapter, we show how to directly transact as Trade Executor when manual correction operations are required (broken token, airdrops, etc.).

Sending a transaction through the hot wallet
--------------------------------------------

Here is an example how ot constrct a transaction through the Trade Executor console from the hot wallet.

In this example, we do ERC-20 transfer. If a token is outside guard's rules, it is usually free to transfer.

Stop Trade Executor.

Then start the console from terminal using Docker Compose.

.. code-block:: shell

    docker compose run ethereum-memecoin-swing console

Copy paste script wit ``%cpaste` to execute a transaction.

.. code-block:: python

    from decimal import Decimal
    from eth_defi.token import fetch_erc20_details
    from eth_defi.trace import assert_transaction_success_with_explanation
    from eth_defi.enzyme.vault import Vault

    print("Using RPC provider", web3.provider)

    transfer_amount = Decimal(5004)
    target_address = "0xC9E60a9605a67c408a16c47652070Aa5E28ddD64"

    print(f"Sending USDC from our hot wallet {hot_wallet.address}, amount {transfer_amount} USDC")
    usdc_address = "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48"  # USDC on Ethereum
    usdc = fetch_erc20_details(web3, usdc_address)
    our_address = hot_wallet.address

    out_gas_balance = web3.eth.get_balance(hot_wallet.address) / (10**18)
    our_usdc_balance = usdc.fetch_balance_of(our_address)
    assert our_usdc_balance > transfer_amount, f"We have only {our_usdc_balance} USDC at {hot_wallet.address}, we need {transfer_amount} USDC"

    raw_amount = usdc.convert_to_raw(transfer_amount)

    tx_hash = usdc.contract.functions.transfer(
        target_address,
        raw_amount,
    ).transact({"from": hot_wallet.address})
    print(f"Transfer in TX {tx_hash.hex()}")
    assert_transaction_success_with_explanation(web3, tx_hash)
    print(f"All done")

Sending a transaction through the vault
---------------------------------------

TODO: See vault deployment chapter for examples.

.. note ::

    The transaction will be checked by the onchain guard smart contract, and it will be reverted
    if it does not adhere guard's rules.