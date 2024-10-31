from setuptools import find_packages, setup

setup(
    name="src",
    packages=find_packages(include=['src', 'src.*']),  # Explicitly include src
    version="0.1.0",
    description="Covering course materials from AI Devs 3 - Agents",
    author="Tomasz Gusciora",
    license="MIT",
)