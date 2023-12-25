import uvicorn


if __name__ == "__main__":
    uvicorn.run(app="src:app",port=9000, reload=True, host="0.0.0.0")