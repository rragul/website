FROM python
COPY COPY . /
EXPOSE 5100
CMD ["python", "-m", "http.server", "5100"]
