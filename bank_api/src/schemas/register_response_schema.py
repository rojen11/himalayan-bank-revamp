from pydantic import BaseModel


class RegisterResponse(BaseModel):
    account_number: str
    phone: str
    account_name: str