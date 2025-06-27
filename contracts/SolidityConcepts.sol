// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolidityConcepts {
    // 1. 상태 변수
    uint256 public constant FIXED_VALUE = 100; 
    address public immutable owner;            
    uint256 public value = 50;                 

    // 2. 이벤트
    event ValueChanged(uint256 oldValue, uint256 newValue);

    // 3. 생성자
    constructor() {
        owner = msg.sender;
    }

    // 4. 조건문 검사 함수
    function checkValue(uint256 _input) public pure returns (string memory) {
        if (_input > 100) {
            return "Value is greater than 100";
        } else if (_input == 100) {
            return "Value is exactly 100";
        } else {
            return "Value is less than 100";
        }
    }

    // 5. 반복문 검사 함수
    function sumUpTo(uint256 _n) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= _n; i++) {
            sum += i;
        }
        return sum;
    }

    // 6. 상태 변경 + 이벤트 발생 함수
    function updateValue(uint256 _newValue) public {
        uint256 oldValue = value;
        value = _newValue;

        emit ValueChanged(oldValue, _newValue);
    }

    // 7. modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // 8. modifier 적용 함수
    function ownerFunction() public view onlyOwner returns (string memory) {
        return "Hello, Owner!";
    }

    // 9. 이더 송금 관련 함수
    receive() external payable {}

    function sendEther(address _to) public payable {
        require(msg.value > 0, "Must send ether");

        payable(_to).transfer(msg.value);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withDraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}
