import { EventEmitter, Subscription } from "expo-modules-core";
import ExpoAdsetModule from "./src/ExpoAdsetModule";
const emitter = new EventEmitter(ExpoAdsetModule);

export function addRewardListener(
  listener: (event: any) => void
): Subscription {
  return emitter.addListener("onReward", listener);
}

interface AdSet {
  reward(): void;
}

export default ExpoAdsetModule as AdSet;
