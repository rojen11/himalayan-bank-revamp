from datetime import timedelta
from typing import Annotated
from fastapi import Depends, HTTPException, status

from sqlalchemy.orm import Session

from fastapi.security import OAuth2PasswordRequestForm

from src.core.db import get_db
from src.core.authenticate_user import authenticate_user
from src.utils import create_access_token


def login(
    form_data: Annotated[OAuth2PasswordRequestForm, Depends()],
    db: Session = Depends(get_db),
):
    user = authenticate_user(db, form_data.username, form_data.password)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect username or password",
            headers={"WWW-Authenticate": "Bearer"},
        )
    access_token_expires = timedelta(minutes=30)
    access_token = create_access_token(
        data={"sub": user.phone}, expires_delta=access_token_expires
    )
    return {"access_token": access_token, "token_type": "bearer"}
