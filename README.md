# tutorial_fMRIPrep_2020_vincent

The fMRIPrep tutorial for the ORIGAMI lab. [fMRIPrep link](https://fmriprep.org/en/stable/).

------
## Commands for building fMRIPrep containers
```sudo docker pull poldracklab/fmriprep:latest```

```sudo singularity build fmriprep_latest.simg docker://poldracklab/fmriprep:latest```
## Running fMRIPrep on local machine
### Docker
```sudo docker run -it -v host_bids_dir:/data:ro -v host_derivates_dir:/out poldracklab/fmriprep:latest /data /out --participant_label sub-0001```

* You need to change "host_bids_dir" for your BIDS path on your machine, and \data is the BIDS path inside the container;
* You need to change "host_derivates_dir" for your output directory. 
### Singularity
```singularity run --cleanenv -B host_bids_dir:/data:ro -B host_derivates_dir:/out fmriprep_latest.simg (singularity container) /data /out --participant_label sub-0001```

* You need to change "host_bids_dir" for your BIDS path on your machine, and \data is the BIDS path inside the container;
* You need to change "host_derivates_dir" for your output directory. 
## Running fMRIPrep on slurm HPC (codes in /scripts)
### fmriprep.sh
Prepare running env and submit job.
### fmriprep.slurm
Scripts for running fMRIPrep in parallel.
### fmriprep.format
Collect the results.
### select_ses-2.json
Select specific input data (session 2 here for both T1 and bold images).

# Resources
## Official websites:
1. [fMRIPrep](https://fmriprep.org/en/stable/) and its [github](https://github.com/poldracklab/fmriprep);
2. [BIDS](https://bids.neuroimaging.io/), [BIDS App github](https://github.com/BIDS-Apps) and [BIDS derivatives](https://docs.google.com/document/d/17ebopupQxuRwp7U7TFvS6BH03ALJOgGHufxK8ToAvyI/edit#heading=h.wo1gx72glci0);
3. [NeuroStars](https://neurostars.org/) for more questions;
4. [Compute Canada documentation](https://docs.computecanada.ca/wiki/Getting_started).
## Tutorials.
1. The [Standford fMRIPrep tutorial](https://reproducibility.stanford.edu/fmriprep-tutorial-running-the-docker-image/);
2. [Andrew's Brain Book](https://andysbrainbook.readthedocs.io/en/latest/OpenScience/OS/fMRIPrep.html#fmriprep) with youtube [videos](https://www.youtube.com/watch?v=J0npRWV2zTY);
3. ~~~[DartBrains course chapter](https://dartbrains.org/features/notebooks/8_fmriprep_tutorial.html) by Sasha Brietzke & Luke Chang;~~~
4. [Tutorials: BIDS, fMRIPrep, MRIQC](https://rpubs.com/sarenseeley/bids-fmriprep-mriqc) by Saren Seeley;
5. [Brainlife tutorials](https://brainlife.io/docs/tutorial/fmri-preprocessing-tutorial/);
6. [Neuroimaging Core Documentation](https://neuroimaging-core-docs.readthedocs.io/en/latest/) by Dianne Patterson.
