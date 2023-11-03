# CHP

This document's purpose is to explain the development workflow.

## Table of content

| Content | Description |
| :------ | :---------- |
| [1. Prerequisites](#1-prerequisites) | Explains what we need before start |
| [2. Installation](#2-installation) | Explains how to install the project on your machine |
| [3. Daily Work](#3-development-workflow) | Quick cheatsheet of the different steps of the developement workflow |
| [4. Troubleshoots](#4-troubleshoots) | Extra information for know troubleshoots |


### 1 Prerequisites

- Node 18 (we recommend to install it using [nvm](https://github.com/nvm-sh/nvm#installing-and-updating)):
- Python 3.9.10 (we recommend to install it using [Pyenv](https://github.com/pyenv/pyenv#installation))
- [Pipenv](https://pypi.org/project/pipenv/) (We recommend to install it using pip): `pip install --user pipenv`

## 2 Installation

To install this project, you will need the project files (downloaded with git) and a database dump.

1. Install the project files by cloning the git repository: <https://github.com/Chris97e/paramar.git>. 
2. You will need a dump of the database in order to have content to work with. you can ask it from a developer on the project.
3. Enter to our virtual enviroment by using ```pipenv shell```
4. Install our pyhton dependencies ```pip i```
5. Create a superuser with ```python3 manage.py createsuperuser```
6. Makes migrations from our database ```python3 manage.py makemigrations```
7. Migrate the database ```python3 manage.py migrate```
8. Run backend server with ```python3 manage.py runserver```
9. In another terminal install our npm dependecies with ```npm i```
10. Run our frontend copiler with ```npm run frontend```

## 4 Troubleshoots
Guide to resolve common problems.

### 4.1 Problems adding custom fonts
If you intend to include custom fonts, please ensure that they are placed inside the 'public/fonts/[font-name]' directory.
