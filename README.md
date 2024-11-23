# Secret Storage lab

This lab is a bit different than the others but it will give us a good understanding of how storage works and how to use tools like `cast` to interact with already deployed contracts.

## Conditions to satisfy

For this lab we are going to use a script we already created that will: 

1. Have a local node of the Cancun network running on localhost:8545
2. Change the address `0xADD` in the `Exploit.t.sol` to the address of the Vulnerable.sol contract (see console)

Once VScode is open, you should see the following outuput (address values migh be different):

```bash
Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
Transaction hash: 0xca0f2c252946ea1ae1124c42c782a087b0328551122c14b6412c5fa8886f4a52
```

If not, redeploy the contract on the Cancun blockchain network using 

```sh
./deploy_contract.sh
```
## Run the lab

Run the tests with the following command:

```shell
forge test --fork-url=http://127.0.0.1:8545 -vvvv
```

## Solve the lab

Decode the secret and call `pwn(SECRET)` to unlock the vault.

## Solution

If you are stuck, you can check the solution using the following commands:

```shell
git checkout solution
git pull
```

> make sure that your previous changes are stashed or committed before running the above commands. You can run `git stash` to stash your changes, or `git commit -am "my changes"` to commit your changes.

Check the files

- `./test/Exploit.t.sol` (forge exploit)

Rerun the command `forge test --fork-url=http://127.0.0.1:8545 -vvvv` to check if the solution is correct.

## Hints

Use the `cast` command to interact with the contract

```shell
cast storage CONTRACT_ADDRESS 
```
