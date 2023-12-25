from sqlalchemy.orm import Session
from sqlalchemy import select

from src.models import Account

def get_account(db: Session, account_number: str, account_name: str):
    result = db.execute(
        select(Account)
        .where(Account.account_name == account_name)
        .where(Account.account_number == account_number)
    ).one_or_none()


    account = result[0] if result is not None else None

    return account