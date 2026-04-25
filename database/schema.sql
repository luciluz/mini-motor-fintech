-- Accounts
CREATE TABLE if NOT EXISTS accounts (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone TEXT UNIQUE,
    balance BIGINT CHECK(balance >= 0) NOT NULL DEFAULT 0
);

-- Transactions
CREATE TABLE if NOT EXISTS transactions (
    id BIGSERIAL PRIMARY KEY,
    from_account_id BIGINT NOT NULL,
    to_account_id BIGINT NOT NULL,

    amount BIGINT CHECK(amount > 0),
    status VARCHAR CHECK(status IN ('PENDING', 'COMPLETED', 'REJECTED')) DEFAULT 'PENDING',

    created_at TIMESTAMPTZ DEFAULT NOW(),

    FOREIGN KEY (from_account_id) REFERENCES accounts(id),
    FOREIGN KEY (to_account_id) REFERENCES accounts(id)
);