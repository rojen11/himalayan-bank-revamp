from pydantic import BaseModel


class AccountRequest(BaseModel):
    account_name: str
    account_number: str