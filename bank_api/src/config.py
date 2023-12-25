import os

SECRET_KEY = "hfahjfahjfbewuinfwbuifbwds"
ALGORITHM = "HS256"

SQLALCHEMY_DATABASE_URL = os.getenv("SQLALCHEMY_DATABASE_URL", "postgresql://postgres:postgresdb@localhost/bank")


BANK_ACCOUNT_NAME = "bank"
BANK_ACCOUNT_NUMBER = "00000"

BANK_PERCENT = 0.01