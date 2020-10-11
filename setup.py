# WARNING: SETUP.PY MODIFIED FOR USE WITH CATKIN BUILD
# DO NOT RUN PYTHON SETUP.PY INSTALL ON THIS FILE

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

def readme():
    with open('README.md') as f:
        return f.read()


setup_args = generate_distutils_setup(
    name='autocone',
    version='0.0.1',
    author='George Chustz',
    author_email='gchustz@tamu.edu',
    description='A package which implements a simple spline control algorithm on a rover',
    long_description=readme(),
    url="https://github.com/unmannedlab/autocone",
    packages='autocone_tools',
    package_dir={'' : 'src'},
    classifiers=[
        'Development Status :: 0 - Alpha',
        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
        'Programming Language :: Python :: 3',
        'Topic :: Robotics'
    ]
    )

setup(**setup_args)
