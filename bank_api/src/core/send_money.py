from fastapi import HTTPException
from sqlalchemy.orm import Session
from src.core.account import get_account
from src.models import Account
from src.models import Log
from src.schemas import AccountRequest


def send_money(db: Session, source_account: AccountRequest, destination_account: AccountRequest, amount: float, remarks: str):

    source_account: Account = get_account(
        db, source_account.account_number, source_account.account_name
    )

    if source_account is None:
        return HTTPException(404, "Source account not found!")

    destination_account: Account = get_account(
        db,
        destination_account.account_number,
        destination_account.account_name,
    )

    if destination_account is None:
        return HTTPException(404, "Destination account not found!")

    source_account.balance -= amount
    destination_account.balance += amount

    # log for source_account
    log1 = Log(
        source_account=source_account.id,
        destination_account=destination_account.id,
        amount=amount,
        debited=True,
        remarks=remarks
    )

    # log for destination account
    log2 = Log(
        source_account=destination_account.id,
        destination_account=source_account.id,
        amount=amount,
        debited=False,
        remarks=remarks
    )

    db.add(log1)
    db.add(log2)

    db.commit()
    
    db.refresh(log1)
    db.refresh(log2)

    print(
        f"Transferring {amount} from {source_account} to {destination_account}: {remarks}"
    )
