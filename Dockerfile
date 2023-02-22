FROM python:3.10-alpine
WORKDIR /code

# copy over the requirements file and run pip install to install the packages into your container at the directory defined above
COPY ./requirements.txt /code/requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /code/requirements.txt
COPY ./app /code/app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
