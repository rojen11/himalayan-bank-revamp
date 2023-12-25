
from pydantic import BaseModel

from . import AccountRequest


class TransferRequest(BaseModel):
    destination_account: AccountRequest
    amount: float
    remarks: str