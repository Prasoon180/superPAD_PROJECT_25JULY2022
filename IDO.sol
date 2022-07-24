//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.15;
//import "github.com/Prasoon180/superPAD_final_project/blob/main/BEP20.sol";
//import "github.com/Prasoon180/superPAD_final_project/blob/main/IBEP20.sol";
import "github.com/Prasoon180/superPAD_PROJECT_25JULY2022/blob/main/IBEP20.sol";

// till here BEP20 token formation done

contract IDO  {                   // This is main contract ie; IDO.sol

IBEP20  public  bep20Address;
uint _weeksforPrivate;
uint _weeksforPublic;                   // define variable of weeks and months of individual item
uint _monthsforReward;
uint _monthsforReserve;
uint _monthsforTeam;
uint _monthsforMarket;
uint _monthsforLiquidity;

uint _TGEforPrivate;
uint _TGEforPublic;
uint _TGEforReserve;
uint _TGEforReward;                    // define variable of TGE of individual item
uint _TGEforTeam;
uint _TGEforLiquidity;
uint _TGEforMarket;
address public owner;

constructor(address _bep20Address) {
    bep20Address = IBEP20(_bep20Address);
    _TGEforPrivate = block.timestamp; 
    _TGEforPublic = block.timestamp;
    _TGEforReward = block.timestamp; //  here TGE is initial time permanently set for individual item
    _TGEforReserve = block.timestamp;   
    _TGEforTeam = block.timestamp;
    _TGEforLiquidity = block.timestamp;
    _TGEforMarket = block.timestamp;  
    owner = msg.sender;              // owner of smart contract
}

    
modifier onlyOwner(){                       // modifier function used here
        require(msg.sender == owner ,"you can't unlock now");
        _;
    }         // modifier is used, to be only called by msg.sender of the contract      


function _private(address to , uint _amount) public onlyOwner  {
    // 1 WEEK = 604800 seconds            // function define for private


if(_weeksforPrivate >= 0 && _weeksforPrivate < 41) {                // _weeks = 41
    require(block.timestamp > _TGEforPrivate, "1 WEEK NOT OVER");
     bep20Address.transfer( to, _amount);                           // 1 WEEK = 604800 seconds
     _weeksforPrivate ++;
    _TGEforPrivate += 604800 seconds;
}
if(_weeksforPrivate >= 41) {
     require(block.timestamp + _TGEforPrivate < _TGEforPrivate, "YOUR TIME PERIOD IS OVER");
}

}

function _public(address to, uint _amount) public onlyOwner {
                 // // function define for public
               // 1 WEEK = 604800 seconds
      if(_weeksforPublic >= 0 && _weeksforPublic < 15) {                   // _weeks = 15
          require(block.timestamp > _TGEforPublic, "1 WEEK NOT OVER");
          bep20Address.transfer( to, _amount);
          _weeksforPublic ++;
          _TGEforPublic += 604800 seconds;                // 1 WEEK = 604800 seconds
      }
    if(_weeksforPublic >= 15) {
     require(block.timestamp + _TGEforPublic < _TGEforPublic, "YOUR TIME PERIOD IS OVER");
     
}  
}

function reward(address to, uint _amount) public {
   
               // 1 MONTH = 30 DAYS ;   30 DAYS = 2592000 seconds
              // // function define for reward
    if(_monthsforReward >= 0 && _monthsforReward < 26) {                    // _weeks = 26
       require(block.timestamp >  _TGEforReward, "1 MONTH NOT OVER FOR REWARD");
          bep20Address.transfer( to, _amount);
          _monthsforReward ++;
          _TGEforReward += 2592000 seconds;    //1 MONTH = 30 DAYS ;   30 DAYS = 2592000 seconds
    }
    if(_monthsforReward >=26) {
       require(block.timestamp +  _TGEforReward <  _TGEforReward, "REWARD TIME PERIOD IS OVER"); 
     
    }
}

function reserve(address to, uint _amount) public onlyOwner {
                       // function define for reserve
    if(_monthsforReserve >= 0 && _monthsforReserve < 14) {                           // _weeks = 14
        require(block.timestamp > _TGEforReserve, "LOCKUP PERIOD NOT OCCUR PROPERLY FOR RESRVE");
        _monthsforReserve ++;
        _TGEforReserve += 2592000 seconds;          // 1 MONTH = 30 DAYS ;   30 DAYS = 2592000 seconds
         }
    if(_monthsforReserve >= 14 && _monthsforReserve < 26) {                // _weeks 14 to 26
       require(block.timestamp > _TGEforReserve, "1 MONTH NOT OVER FOR RESERVE");
          bep20Address.transfer( to, _amount);
          _monthsforReserve ++;
          _TGEforReserve += 2592000 seconds;  
    }
     if(_monthsforReserve >=26) {
       require(block.timestamp + _TGEforReserve < _TGEforReserve, "RESERVE TIME PERIOD IS OVER"); 
        
    }

}

function market(address to, uint _amount) public {
                // function define for market
    
    if(_monthsforMarket >= 0 && _monthsforMarket < 26) {                               // _weeks = 26
       require(block.timestamp >_TGEforMarket, "1 MONTH NOT OVER FOR MARKET");
          bep20Address.transfer( to, _amount);
          _monthsforMarket ++;                // 1 MONTH = 30 DAYS ;   30 DAYS = 2592000 seconds
          _TGEforMarket += 2592000 seconds; 
    }
    if(_monthsforMarket >=26) {
       require(block.timestamp + _TGEforMarket < _TGEforMarket, "MARKET TIME PERIOD IS OVER"); 
      }
      }
      
      function team(address to, uint _amount) public {
                 // function define for team
          if(_monthsforTeam >= 0 && _monthsforTeam < 14) {                     // _weelks = 14 
        require(block.timestamp > _TGEforTeam, "LOCKUP PERIOD NOT OCCUR PROPERLY FOR TEAM");
        _monthsforTeam ++;
        _TGEforTeam += 2592000 seconds;          // 1 MONTH = 30 DAYS ;   30 DAYS = 2592000 seconds
         }
    if(_monthsforTeam >= 14 && _monthsforTeam < 26) {                         // _weeks = 26
       require(block.timestamp > _TGEforTeam, "1 MONTH NOT OVER FOR TEAM");
          bep20Address.transfer( to, _amount);
          _monthsforTeam ++;
          _TGEforTeam += 2592000 seconds;  
    }
     if(_monthsforTeam >=26) {
       require(block.timestamp + _TGEforTeam < _TGEforTeam, "TEAM TIME PERIOD IS OVER"); 
       }
       }

    function liquidity(address to, uint _amount) public {
           // function define for liquidity
    if(_monthsforLiquidity >= 0 && _monthsforLiquidity < 14) {              // _months = 14
       require(block.timestamp > _TGEforLiquidity, "1 MONTH NOT OVER FOR LIQUIDITY");
          bep20Address.transfer( to, _amount);
          _monthsforLiquidity ++;
          _TGEforLiquidity += 2592000 seconds;            // 1 MONTH = 30 DAYS ;   30 DAYS = 2592000 seconds
    }
    if(_monthsforLiquidity >=14) {
       require(block.timestamp + _TGEforLiquidity < _TGEforLiquidity, "LIQUIDITY TIME PERIOD IS OVER"); 
       
    }  
    }
}

