from pydantic import BaseModel
from datetime import datetime

from . import AccountRequest


class Transaction(BaseModel):
    id: int
    source_account: AccountRequest
    destination_account: AccountRequest
    amount: float
    debited: bool
    transaction_date: datetime