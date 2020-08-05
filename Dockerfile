FROM "continuumio/anaconda3"

# Install tensorflow
RUN pip install --upgrade tensorflow

# Start Jupyter notebook web application
RUN mkdir /opt/notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py

# Update all anaconda dependencies
RUN conda update conda
RUN conda update anaconda
RUN conda update --all

# Listen on the specified network ports at runtime
EXPOSE 8888

# Defaults for an executing container
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser"]
