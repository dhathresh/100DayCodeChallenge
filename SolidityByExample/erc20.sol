// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol
interface IERC20 {

    function transfer(address recipient, uint amount) external returns (bool);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}


contract ERC20 is IERC20 {
    uint public totalsupply;
    mapping(address=> uint ) public balance; //store balances of the account holders 
    mapping(address =>mapping(address=>uint)) public allowance_; //adllowing the spender to spend this allowance share
    string public name= "RogToken";
    string public symbol = "ROG"; 
    uint8 public decimals = 18; //decimals of the token we are creating
    address public  owner1= msg.sender;



    function transfer(address recipient, uint amount) external returns (bool){
        //tranfer form msg.sender to recipent
        balance(owner1) -= amount;
        balance(recipient) +=amount;
        emit Transfer(msg.sender, recipient, amount);
        return true; // this means the call to function was successful
    }


    function approve(address spender, uint amount) external returns (bool){
        //msg.sender will be allowing the spender to spend some amount behalf of him
        allowance_[msg.sender][spender]= amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool){
        allowance_[sender][msg.sender] -= amount;
        balance[sender] -= amount;
        balance[recipient] +=amount; 
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) external{
        balance[msg.sender] +=amount;
        totalsupply += amount;
        emit Transfer(address(0), msg.sender, amount); 
    }
    function burn(uint amount) external{
        balance[msg.sender] -= amount;
        totalsupply -= amount;
        emit Transfer(msg.sender, address(0), amount); 
    }




}
