from sqlalchemy.orm import Session
from sqlalchemy import select

from src.models import User


def get_user(db: Session, username: str):
    result = db.execute(select(User).where(User.phone == username)).one_or_none()
    return result[0] if result is not None else None