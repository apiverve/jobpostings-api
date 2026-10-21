from setuptools import setup, find_packages

setup(
    name='apiverve_jobpostings',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Job Postings is a jobs API that returns the open positions on a company's public career board. Every job comes back in the same shape: title, department, team, locations, remote and workplace type, employment type, posting date and apply link. Filter by keyword, location, department, employment type, posting date or remote. Paid plans add the full job description and salary ranges where the company publishes them.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/jobpostings?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
