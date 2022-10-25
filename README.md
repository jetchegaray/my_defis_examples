# my_defis_examples

#to run it 

$npm install

$truffle develop (local) 
> migrate --reset 


(to get DAI to test it you can use https://oasis.app/#earn)


1 - example how to interact to compound  

    several options. 
    you can run compound locally as it says --> https://github.com/compound-finance/compound-protocol 
    testnet, you have to see the network folder to see the address of the SC for each testnet. 
    ganache --fork infuranode -u daiadminSCaddress  
    

2 - example how to interact to DAI

    if you want to run it in test env

     * use kovan faucet to get ether
     * oasis to get some DAI
     * I need the address of the dai token in that testnet  in daitoken.md
     * send some dai to the SC
     * execute foo
     * deploy in infura and private key

3 - example how to interact to uniswap v1 
