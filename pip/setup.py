from setuptools import setup

setup(
    name='serverchan-sdk',
    version='1.0.6',
    description='Python SDK for ServerChan',
    author='easychen',
    author_email='easychen@gmail.com',
    packages=['serverchan_sdk'],
    install_requires=[
        'requests>=2.0.0',
    ],
    url='https://sct.ftqq.com',
    python_requires='>=3.6',
)
