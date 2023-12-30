from pydantic import BaseModel


class RegisterRequest(BaseModel):
    phone: str
    password: str
    account_number: str
    account_name: str