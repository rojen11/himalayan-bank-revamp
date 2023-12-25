from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import ForeignKey

from .base import Base

class Account(Base):
    __tablename__ = "accounts"

    id: Mapped[int] = mapped_column(autoincrement=True, primary_key=True)
    account_number: Mapped[str] = mapped_column(unique=True)
    account_name: Mapped[str] = mapped_column()
    balance: Mapped[float] = mapped_column()
    user_id: Mapped[int] = mapped_column(ForeignKey("users.id"))

    user: Mapped["User"] = relationship(back_populates="account", lazy='joined')