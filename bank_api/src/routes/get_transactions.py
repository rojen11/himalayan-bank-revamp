
from fastapi import Depends, HTTPException
from sqlalchemy.orm import Session, aliased
from sqlalchemy import select, desc
from typing import Annotated, Tuple

from src.core.db import get_db
from src.core.current_user import get_current_user
from src.models import User, Account, Log
from src.schemas import TransactionResponse


def get_transactions(
    current_user: Annotated[User, Depends(get_current_user)],
    db: Session = Depends(get_db),
):
    result = db.execute(
        select(Account).where(Account.user_id == current_user.id)
    ).one_or_none()

    account: Account = result[0] if result is not None else None

    if account is None:
        return HTTPException(404, "Account not found.")

    SourceAccount = aliased(Account)
    DestinationAccount = aliased(Account)

    log_result: Tuple[Log, Account] = db.execute(
        select(Log, DestinationAccount)
        .select_from(Log)
        .where(Log.source_account == account.id)
        .join(SourceAccount, Log.source_account == SourceAccount.id)
        .join(DestinationAccount, Log.destination_account == DestinationAccount.id)
        .order_by(desc(Log.transaction_date))
    ).all()

    def combine(x):
        
        log =  x[0]

        dict1 = {
                "destination_account": {
                    "account_name": x[1].account_name,
                    "account_number": x[1].account_number,
                },
                "id": log.id,
                "transaction_date": log.transaction_date,
                "amount": log.amount,
                "debited": log.debited
            }

        return dict1

    response = list(map(
        combine,
        log_result,
    ))

    return TransactionResponse(transactions=response)