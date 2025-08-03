#!/bin/bash

# Function to check if Anvil is running
is_anvil_running() {
    pgrep -f "anvil" > /dev/null 2>&1
}

# Function to kill Anvil if it's running
kill_anvil() {
    pkill -f "anvil"
}

# Check if Anvil is running
if is_anvil_running; then
    echo "Anvil is already running. Restarting Anvil..."
    kill_anvil
    sleep 2
else
    echo "Anvil is not running. Starting Anvil..."
fi

# Start Anvil in the background
anvil --hardfork cancun > anvil_output.log 2>&1 &
ANVIL_PID=$!

# Wait for Anvil to start
sleep 5

# Extract the account address from Anvil output
ACCOUNT_ADDRESS=$(grep -o '0x[0-9a-fA-F]\{40\}' anvil_output.log | head -1)



# Extract the private key from Anvil output
PRIVATE_KEY=$(grep -o '0x[0-9a-fA-F]\{64\}' anvil_output.log | head -1)

SECRET=$(uuidgen)

# Deploy the contract using Forge
forge create --from $ACCOUNT_ADDRESS ./src/Vulnerable.sol:Hackme --constructor-args=$SECRET --unlocked --rpc-url http://localhost:8545 \
    --private-key $PRIVATE_KEY --broadcast
