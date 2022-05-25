
require("dotenv").config();
const main = async() =>{
    const betContractFactory = await hre.ethers.getContractFactory("betMain");
    const betMainContract = await betContractFactory.deploy();

    await betMainContract.deployed();

    console.log("Contract deployed to: ", betMainContract.address);
    
    
   // let betTx = await betMainContract._createMatchs("RCB","GT");//.send({from:process.env.PUBLIC_KEY});

    //await betTx.wait();
    console.log("Match is Set")


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