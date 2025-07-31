### Proof-of-Work `PoW`
- **Mining** find a string that produces hash with bunch of zeroes
  `generating string is hard, but checking is easy (proof of work PoW)`
- **Block** structure with `data, timestamp, prev_hash, index, nonce, hash`
- **Nonce** incremented when string hash doesn't have bunch of zeros to change the hash
- **Prev Hash** hash of prev block, for creating valid blockchain
- **Timestamp** for validating that transaction actually happened at the time that was said
- **Index** probably unique identifier to avoid duplicate blocks
``` rust
struct Transaction {
    sender: Address,
    receiver: Address,
    amount: u64,
    signature: Signature,
}

struct Block {
    index: u64,
    timestamp: u64,
    prev_hash: Hash,
    nonce: u64,
    hash: Hash,
}

impl Block {
    fn new(index: u64, transactions: &[Transaction], prev_hash: Hash) -> Block {
        let timestamp = cur_timestamp();
        let nonce = 0;
        let hash = calc_hash(index, timestamp, transactions, prev_hash, nonce);
        Block { index, timestamp, transactions, prev_hash, nonce, hash }
    }
    
    fn mine(&mut self, difficulty: usize) {
        while !self.hash.starts_with(&"0".repeat(diffuculty)) {
            self.nonce += 1;
            self.hash = calc_hash(self.index, self.timestamp, &self.transactions, self.prev_hash, self.nonce);
        }
    }
}

struct Blockchain {
    chain: Vec<Block>
    pending_transactions: Vec<Transaction>,
    difficulty: usize,
}

impl Blockchain {
    fn new() -> Blockchain {
        let genesis_block = Block::new(0, vec![], "0".into());
        Blockchain { chain: vec![ genesis_block ], pending_transactions: vec![], difficulty: 4 }
    }
    
    fn add_transaction(&mut self, tx: Transaction) {
        self.pending_transactions.push(tx)
    }

    fn mine_block(&mut self) {
        let prev_hash = self.chain.last().unwrap().hash.clone();
        let block = Block::new(self.chain.len() as u64, self.pending_transactions.clone(), prev_hash);
        block.mine(self.difficulty);
        self.chain.push(block);
        self.pending_transactions.clear();
    }
}
```
### Proof-of-Stake `PoS`
**Validators** stake to be chosen to verify transactions and get rewards
validators get **slashed** if they are dishonest, but since they put stake
they likely plan to be honest to get rewards, otherwise it makes no financial sense
``` rust
struct Validator {
    address: Address,
    stake: u64,
    reward: u64,
}

struct Block {
    index: u64,
    timestamp: u64,
    transactions: Vec<Transaction>,
    prev_hash: Hash,
    validator: Address,
    signature: Signature,
    hash: Hash,
}

struct Blockchain {
    chain: Vec<Block>,
    pending_transactions: Vec<Transaction>,
    validators: Vec<Validator>
}

impl Blockchain {
    fn new() -> Blockchain {
        let genesis_block = Block::new(0, vec![], "0",into(), Address::default());
        Blockchain {
            chain: vec![genesis_block],
            pending_transactions: vec![],
            validators: vec![],
        }
    }
    
    fn stake(&mut self, validator: Address, amount: u64) {
        if let Some(v) = self.validators.iter_mut().find(|v| v.address == validator) {
            v.stake += amount;
        } else {
            self.validators.push(Validator { address: validator, stake: amount, reward: 0 });
        }
    }
    
    fn select_validator(&self) -> Address {
        let total_stake: u64 = self.validators.iter().map(|v| v.stake).sum();
        let mut rng = random();
        let mut cumulative = 0;
        for validator in &self.validators {
            cumulative += validator.stake;
            if rng < cumulative / total_stake {
                return validator.address;
            }
        }
        self.validators[0].address
    }

    fn create_block(&mut self) {
        let validator = self.select_validator();
        let prev_hash = self.chain.last().unwrap().hash.clone();
        let block = Block::new(self.chain.len() as u64, 
            self.pending_transactions.clone(), prev_hash, validator))
    }
}
```
