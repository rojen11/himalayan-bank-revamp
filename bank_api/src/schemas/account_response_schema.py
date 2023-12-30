from pydantic import BaseModel


class AccountResponseSchema(BaseModel):
    account_name: str
    account_number: str