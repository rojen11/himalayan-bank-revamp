from sqlalchemy.orm import Mapped, mapped_column 
from sqlalchemy import ForeignKey

from datetime import datetime

from .base import Base

class Log(Base):
    __tablename__ = "logs"

    id: Mapped[int] = mapped_column(autoincrement=True, primary_key=True)
    source_account: Mapped[int] = mapped_column(ForeignKey("accounts.id"))
    destination_account: Mapped[int] = mapped_column(ForeignKey("accounts.id"))
    amount: Mapped[float] = mapped_column()
    debited: Mapped[bool] = mapped_column()
    transaction_date: Mapped[datetime] = mapped_column(default=datetime.now)
    remarks: Mapped[str] = mapped_column(default="")