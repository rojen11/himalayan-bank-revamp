from sqlalchemy import select
from sqlalchemy.orm import Session

from typing import Annotated

from fastapi import Depends, HTTPException
from src.core.current_user import get_current_user
from src.core.db import get_db
from src.models.account import Account

from src.models.user import User
from src.schemas.account_response_schema import AccountResponseSchema


def my_account(
    current_user: Annotated[User, Depends(get_current_user)],
    db: Session = Depends(get_db),
) -> HTTPException | AccountResponseSchema:
    result = db.execute(
        select(Account).where(Account.user_id == current_user.id)
    ).one_or_none()

    account = result[0] if result is not None else None

    if account is None:
        return HTTPException(404, "Account not found")

    return AccountResponseSchema(account_name=account.account_name, account_number=account.account_number)


