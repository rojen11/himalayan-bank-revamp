from typing import Annotated
from fastapi import Depends
from sqlalchemy.orm import Session
from src import config
from src.core.current_user import get_current_user
from src.core.send_money import send_money
from src.core.db import get_db
from src.models.user import User
from src.schemas.account_request_schema import AccountRequest
from src.schemas.transfer_request_schema import TransferRequest


def transfer(
    data: TransferRequest,
    current_user: Annotated[User, Depends(get_current_user)],
    db: Session = Depends(get_db),
):
    # calculate the amount
    # bank_amount = data.amount * config.BANK_PERCENT
    # destination_amount = data.amount - bank_amount

    source_account = AccountRequest(account_name=current_user.account.account_name, account_number=current_user.account.account_number)

    # transfer to destination account
    send_money(
        db, source_account, data.destination_account, data.amount, data.remarks
    )

    # transfer to bank
    # send_money(db, data.source_account, AccountRequest(account_name=config.BANK_ACCOUNT_NAME, account_number=config.BANK_ACCOUNT_NUMBER), bank_amount, data.remarks)

    return {"status": "OK"}
