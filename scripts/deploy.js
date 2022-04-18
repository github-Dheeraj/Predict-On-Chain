const main = async() =>{
    const nftContractFactory = await hre.ethers.getContractFactory("MyShitNFT");
    const nftContract = await nftContractFactory.deploy();

    await nftContract.deployed();

    console.log("Contract deployed to: ", nftContract.address);

    let nftTx = await nftContract.mintMyShitNFT();

    await nftTx.wait();
    console.log("Minted NFT #1")


}

const runMain = async()=>{
    try{
        await main();
        process.exit(0);
    }
    catch(error){
        console.log(error);
        process.exit(1);
    }
}

runMain();