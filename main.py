from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root(name: str = "Guest"):
    return {"message": f"Hello, {name} ! Welcome to FastAPI!"}

