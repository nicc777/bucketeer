# -*- coding: utf-8 -*-

from setuptools import setup, find_packages

setup(
    name='sample',
    version='0.0.1',
    description='Sample flask app',
    long_description='A long sample readme...',
    author='Nico Coetzee',
    author_email='nicc777@gmail.com',
    url='https://github.com/nicc777/',
    license='',
    install_requires=['flask'],
    packages=find_packages(exclude=('tests', 'docs')),
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'Topic :: Software Development :: Build Tools',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.2',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
],
)
