
from typing import Annotated
from fastapi import Depends, HTTPException

from sqlalchemy.orm import Session
from sqlalchemy import select

from src.core.db import  get_db
from src.core.current_user import get_current_user
from src.models import User, Account
from src.schemas import BalanceResponse


def get_balance(
    current_user: Annotated[User, Depends(get_current_user)],
    db: Session = Depends(get_db),
):
    result = db.execute(
        select(Account).where(Account.user_id == current_user.id)
    ).one_or_none()

    account = result[0] if result is not None else None

    if account is None:
        return HTTPException(404, "Account not found")

    return BalanceResponse(balance=account.balance)


