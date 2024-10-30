import {
  Clarinet,
  Tx,
  Chain,
  Account,
} from "https://deno.land/x/clarinet@v0.12.1/index.ts";
import { assertEquals } from "https://deno.land/std/testing/asserts.ts";

Clarinet.test({
  name: "Should increment upvotes and downvotes independently",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    let wallet1 = accounts.get("wallet_1")!;

    // Upvote and check the count
    let upvoteTx = Tx.contractCall("voting", "upvote", [], wallet1.address);
    let upvoteResult = chain.mineBlock([upvoteTx]).receipts[0].result;
    assertEquals(upvoteResult, "(ok u1)");

    // Downvote and check the count
    let downvoteTx = Tx.contractCall("voting", "downvote", [], wallet1.address);
    let downvoteResult = chain.mineBlock([downvoteTx]).receipts[0].result;
    assertEquals(downvoteResult, "(ok u1)");
  },
});
