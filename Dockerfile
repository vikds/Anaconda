FROM "continuumio/anaconda3"

# Update all anaconda dependencies
RUN conda update conda
RUN conda update anaconda
RUN conda update --all

# Install tensorflow
RUN pip install --upgrade tensorflow

# Install fastText
# Install cython & cysignals before pyfasttext
RUN pip install --upgrade cython && \
    pip install --upgrade cysignals && \
    pip install --upgrade pyfasttext && \
    pip install --upgrade fasttext

# Start Jupyter notebook web application
RUN mkdir /opt/notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py

# Make container to listen the specified network port at the runtime
EXPOSE 8888

# Providing defaults for an executing container
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser"]
