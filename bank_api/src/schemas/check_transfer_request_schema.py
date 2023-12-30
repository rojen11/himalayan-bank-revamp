from pydantic import BaseModel


class CheckTransferRequest(BaseModel):
    account_name: str
    account_number: str
    amount: float