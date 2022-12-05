const Patient = artifacts.require("patient");
module.exports = function (deployer){
    deployer.deploy(Patient);
}