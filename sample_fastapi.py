from typing import Optional

from fastapi import FastAPI

app = FastAPI(title="Sample FastAPI")


@app.get("/")
async def read_root():
    return {"message": "Hello, FastAPI!"}


@app.get("/items/{item_id}")
async def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}