from fastapi import Depends
from sqlalchemy.orm import Session
from src.core.db import get_db

from src.models import Account, User
from src.schemas import RegisterResponse, RegisterRequest
from src.utils import get_password_hash


def register_user_and_account(data: RegisterRequest, db: Session = Depends(get_db)):
    user = User(email=data.email, password=get_password_hash(data.password))

    db.add(user)
    db.commit()
    db.refresh(user)

    account = Account(
        account_number=data.account_number,
        account_name=data.account_name,
        balance=1000,
        user_id=user.id,
    )

    db.add(account)
    db.commit()
    db.refresh(account)

    return RegisterResponse(
        account_name=account.account_name,
        email=user.email,
        account_number=account.account_number,
    )