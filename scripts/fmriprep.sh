#!/bin/bash
DATA_NAME=(${@:1:1})
echo ${DATA_NAME}

WD_DIR=${HOME}/scratch
DATA_DIR=${WD_DIR}/${DATA_NAME}
BIDS_DIR=${DATA_DIR}_BIDS
CODE_DIR=${WD_DIR}/src
CODE_SLURM=${CODE_DIR}/fmriprep.slurm
CODE_COLLECT=${CODE_DIR}/fmriprep.format

SUB_LIST=${CODE_DIR}/${DATA_NAME}_fmriprep_preopt.list
CON_IMG_DIR=${WD_DIR}/container_images/fmriprep_v20.1.1.simg

OUT_DIR=${DATA_DIR}_fmriprep_anat_20.1.1
LOG_DIR=${DATA_DIR}_fmriprep_anat.log
SLURM_LOG_DIR=${DATA_DIR}_fmriprep_anat_slurm_log
WORK_DIR=${DATA_DIR}_fmriprep_anat_work

FREESURFER_LICENSE="${WD_DIR}/container_images"
TEMPLATEFLOW_HOST_HOME=$HOME/scratch/templateflow

chmod +x ${CODE_SLURM}
chmod +x ${CODE_COLLECT}

awk -F"\t" '{print $1}' ${BIDS_DIR}/participants.tsv >> ${SUB_LIST}
sed -i '1d' ${SUB_LIST}

echo "subjects list created!"

if [ -d ${OUT_DIR} ];then
  echo "fmriprep out dir already exists!"
else
  mkdir -p ${OUT_DIR}
fi

if [ -d ${WORK_DIR} ];then
  echo "fmriprep work dir already exists!"
else
  mkdir -p ${WORK_DIR}
fi

if [ -d ${SLURM_LOG_DIR} ];then
  echo "fmriprep slurm log dir already exists!"
else
  mkdir -p ${SLURM_LOG_DIR}
fi

if [ -d ${TEMPLATEFLOW_HOST_HOME} ];then
	echo "Templateflow dir already exists!"
else
	mkdir -p ${TEMPLATEFLOW_HOST_HOME}
	python -c "from templateflow import api; api.get('MNI152NLin2009cAsym')"
	python -c "from templateflow import api; api.get('OASIS30ANTs')"
fi

echo "starting fmriprep!"
sbatch ${CODE_SLURM} ${DATA_NAME} ${CON_IMG_DIR} >> ${LOG_DIR}
