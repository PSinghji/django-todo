# Step 1: Use an official Python image as the base image
FROM python:3.13-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements file into the container
COPY requirements.txt /app/

# Step 4: Install the required Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the Django application code into the container
COPY . /app/

# Step 6: Expose the port the app will run on (default Django port is 8000)
EXPOSE 8000

# Step 7: Run database migrations (optional, only if you want to run migrations automatically)
RUN python manage.py migrate

# Step 8: Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

