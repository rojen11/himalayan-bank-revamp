from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from src import config


engine = create_engine(
    config.SQLALCHEMY_DATABASE_URL
)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

from src.models import Base

Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
