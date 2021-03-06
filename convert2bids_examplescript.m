
% Example script to convert MEG datasets and NIfTI MRI anatomicals to BIDS
% format (i.e. BIDS file naming convention and directory tree structure).

% Written by Lorenzo Magazzini, 23 Apr 2018 (magazzinil@gmail.com)


%% 1. convert a raw MEG dataset to BIDS format

%full path to raw MEG dataset
rawdataset_dir = '/example/data/raw';
rawdataset_name = 'example001_nback.ds';
rawdataset = fullfile(rawdataset_dir, rawdataset_name)

%define BIDS structure fields (see "help rename_meg2bids")
bids = struct;
bids.dir = '/example/data/bids';
bids.participant_label = '001';
bids.task_label = 'nback';

%generate string, full path to MEG dataset in BIDS format
[bidsdataset] = rename_meg2bids(rawdataset, bids)

%copy raw dataset, convert to BIDS format (file name, file path)
[bidsdataset_dir, bidsdataset_name, bidsdataset_ext] = write_meg2bids(rawdataset, bidsdataset)


%% 2. convert a NIfTI file to BIDS format

%full path to NIfTI file
orignifti_dir = '/example/data/raw';
orignifti_name = 'example001.nii';
orignifti = fullfile(orignifti_dir, orignifti_name)

%define BIDS structure fields (see "help rename_nii2bids")
bids = struct;
bids.dir = '/example/data/bids';
bids.participant_label = '001';
bids.modality_label = 'T1w';

%generate string, full path to NIfTI file in BIDS format
[bidsnifti] = rename_nii2bids(orignifti, bids)

%copy original NIfTI, convert to BIDS format (file name, file path)
[bidsnifti_dir, bidsnifti_name, bidsnifti_ext] = write_nii2bids(orignifti, bidsnifti)

