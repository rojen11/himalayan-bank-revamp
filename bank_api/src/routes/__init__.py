from fastapi import APIRouter
from src.routes.transfer import transfer
from src.routes.check_transfer import check_transfer
from src.schemas.account_response_schema import AccountResponseSchema

from src.schemas import Token, TransactionResponse, RegisterResponse, BalanceResponse

from .login import login
from .get_transactions import get_transactions
from .register import register_user_and_account
from .get_balance import get_balance
from .my_account import my_account


router = APIRouter()

router.add_api_route("/token", login, response_model=Token,methods=["POST"])
router.add_api_route("/transactions", get_transactions, response_model= TransactionResponse)
router.add_api_route("/register", register_user_and_account, response_model=RegisterResponse, methods=["POST"])
router.add_api_route("/balance", get_balance, response_model=BalanceResponse)
router.add_api_route("/check-transfer", check_transfer, methods=["POST"])
router.add_api_route("/transfer", transfer, methods=["POST"])
router.add_api_route("/my-account", my_account, response_model=AccountResponseSchema)