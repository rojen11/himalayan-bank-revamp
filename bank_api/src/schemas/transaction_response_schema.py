from typing import List

from pydantic import BaseModel


class TransactionResponse(BaseModel):
    transactions: List