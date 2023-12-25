from fastapi import Depends, Response
from fastapi.responses import JSONResponse
from sqlalchemy import select
from sqlalchemy.orm import Session
from src.core.account import get_account
from src.core.db import get_db
from src.models.account import Account

from src.schemas.account_request_schema import AccountRequest
from src.schemas.check_account_response_schema import CheckAccountResponse


def check_account(name: str, number: str,response: Response, db:Session = Depends(get_db)):
    account = get_account(db, number, name)
    if (account is None):
        response.status_code = 404
        return CheckAccountResponse(found=False)

    return CheckAccountResponse(found=True)