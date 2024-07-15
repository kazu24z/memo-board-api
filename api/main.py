from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from starlette.config import Config
from starlette.datastructures import CommaSeparatedStrings

config = Config("/src/.env")

app = FastAPI()
origins = config("CORS_ORIGINS", cast=CommaSeparatedStrings, default="")

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/hello")
async def hello():
    return {"message": "hello world!"} 
