const CryptoZombies = artifacts.require("CryptoZombies");
const utils = require("./helpers/utils");
const zombieNames = ["Zombie 1", "Zombie 2"];

contract("CryptoZombies", (accounts) => {
    let [alice, bob] = accounts;
    let contractInstance;

    beforeEach(async () => {
        contractInstance = await CryptoZombies.new();
    }); //end beforeEach()
    
    it("should be able to create a new zombie", async () => {
        const result = await contractInstance.createRandomZombie(zombieNames[0], {from: alice});
        assert.equal(result.receipt.status, true);
        assert.equal(result.logs[0].args.name, zombieNames[0]);
    }) //end it()

    it("should not allow two zombies", async () => {
        await contractInstance.createRandomZombie(zombieNames[0], {from: alice});
        await utils.shouldThrow(contractInstance.createRandomZombie(zombieNames[1], {from: alice}));
    }) //end it()

    context("with the single-step transfer scenario", async () => {
        it("should transfer a zombie", async () => {
          // Test the single-step transfer scenario.
          const result = await contractInstance.createRandomZombie(zombieNames[0], {from: alice});
          const zombieId = result.logs[0].args.zombieId.toNumber();
          await contractInstance.transferFrom(alice, bob, zombieId, {from: alice});
          const newOwner = await contractInstance.ownerOf(zombieId);
          assert.equal(newOwner, bob);
        }) //end it()
    }) //end context()
    
    xcontext("with the two-step transfer scenario", async () => {
        it("should approve and then transfer a zombie when the approved address calls transferForm", async () => {
          // Test the two-step scenario.  The approved address calls transferFrom
            const result = await contractInstance.createRandomZombie(zombieNames[0], {from: alice});
            const zombieId = result.logs[0].args.zombieId.toNumber();
            await contractInstance.approve(bob, zombieId, {from: alice});
            await contractInstance.transferFrom(alice, bob, zombieId, {from: bob});
        }) //end it()
        it("should approve and then transfer a zombie when the owner calls transferForm", async () => {
            // TODO: Test the two-step scenario.  The owner calls transferFrom
         }) //end it()
    }) //end context()