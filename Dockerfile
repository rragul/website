FROM python
COPY index.html index.html
EXPOSE 5100
CMD ["python", "-m", "http.server", "5100"]
