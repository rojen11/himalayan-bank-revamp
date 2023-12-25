from pydantic import BaseModel


class CheckAccountResponse(BaseModel):
    found: bool