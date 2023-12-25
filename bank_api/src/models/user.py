from sqlalchemy.orm import Mapped, mapped_column, relationship

from .base import Base

class User(Base):
    __tablename__ = "users"

    id: Mapped[int] = mapped_column(autoincrement=True, primary_key=True)
    email: Mapped[str] = mapped_column()
    password: Mapped[str] = mapped_column()

    account: Mapped["Account"] = relationship(lazy='joined')