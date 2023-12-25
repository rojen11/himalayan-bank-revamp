from pydantic import BaseModel


class RegisterResponse(BaseModel):
    account_number: str
    email: str
    account_name: str