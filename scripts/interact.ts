import { ethers } from "hardhat";
import { SolidityConcepts, SolidityConcepts__factory } from "../typechain-types";

async function main() {
  // 배포된 컨트랙트 주소 (배포 로그에서 복사)
  const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";

  // signer 가져오기
  const [signer] = await ethers.getSigners();

  // 컨트랙트 인스턴스 생성 (타입 안전)
  const contract: SolidityConcepts = SolidityConcepts__factory.connect(contractAddress, signer);

  // value 값 읽기
  const valueBefore = await contract.value();
  console.log(`변경 전 value 값: ${valueBefore}`);

  // value 값 변경 (updateValue 함수 호출)
  const tx = await contract.updateValue(123);
  await tx.wait();
  console.log("value 값을 123으로 변경했습니다.");

  // value 값 다시 읽기
  const valueAfter = await contract.value();
  console.log(`변경 후 value 값: ${valueAfter}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
}); 