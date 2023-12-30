from typing import Annotated
from fastapi import Depends, HTTPException
from fastapi.responses import JSONResponse
from sqlalchemy.orm import Session
from src.core.account import get_account
from src.core.current_user import get_current_user
from src.core.db import get_db
from src.models.user import User
from src.schemas.check_transfer_request_schema import CheckTransferRequest



def check_transfer(current_user: Annotated[User, Depends(get_current_user)], request: CheckTransferRequest, db:Session = Depends(get_db),     ):
    account = get_account(db, request.account_number, request.account_name)
    if (account is None):
        raise HTTPException(status_code=404, detail="Destination account is not valid.")

    if (request.amount > current_user.account.balance):
        raise HTTPException(status_code=400, detail="Insufficient Balance.")    

    return JSONResponse(content="OK",status_code=200)
