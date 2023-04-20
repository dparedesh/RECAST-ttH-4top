![Screenshot](workflow.png)

# ANA-EXOT-2019-26

RECAST spec for HQT - ttH/A with H/A->tt analysis (ANA-EXOT-2019-26)

## Instructions:

Define the variables 

     export REANA_SERVER_URL=https://reana.cern.ch
     export REANA_ACCESS_TOKEN=<your reana token>

Run the setup script and provide the requested info:

     source setup.sh


In the recast input file, you will need to modify the following entries:

- **initdir:**   This should be the directory where you have your recast.yml file

- **input_pMassBDT:** This variable corresponds to the mass point for which the pBDT was optimised. Available mass points are 400, 500, 600, 700, 800, 900, and 1000. 

- **dids:**  your dataset id

- **XSxEff:** This is the x-section times efficiency used as input to the local TopDataPreparation file. It must be provided in pb. 

- **kfactor:** the kfactor of your sample

- **shower:** the showering algorithm used by your sample.

- **nominalWeight:** if you run the recast and it crashes at the online production step, it may be because the nominal weight of your sample is not included into the standard list. If this is the case, the log file will print the list of weights included in the sample. From this list you can choose the nominal weight to be used for your sample, and add it here. Please, be aware of the exact string to be used for the weight, if the weight's name has white spaces at the beginning or at the end of the string, don't remove them! The value must be provided in double quotes and within single quotes at the same time, i.e. '"my weight"'. 
- **pileupFile:**  You need to check if your dids is present in the pileup files currently used by the tool  (`dev/AnalysisTop/PileupReweighting/user.iconnell.Top.PRW.MC16a.FS.v2/prw.merged.root` and `dev/AnalysisTop/PileupReweighting/user.iconnell.Top.PRW.MC16a.AF.v2/prw.merged.root`). If the dids is not present, you must generate your own pileup file as described here https://twiki.cern.ch/twiki/bin/view/AtlasProtected/TopxAODStartGuideR21#9_9_CP_TPileupReweighting_ERROR .  You must provide the full path to your custom pileup file in this field. 

- **muMin:** This is the minimum value to be used for TRexFitter for the signal stregth.

- **muMax:** This is the minimum value to be used for TRexFitter for the signal stregth.

- **input_mc16a:**  the full path in EOS to the mc16a sample. 

- **input_mc16d:**  the full path in EOS to the mc16d sample. 

- **input_mc16e:**  the full path in EOS to the mc16e sample. 


**:warning:** **warning:**  The RECAST for this analysis is  to be run with samples with the following tag: `DAOD_TOPQ1.e7743_a875_r<reco>_p4031`. Samples with a newer ptag will make the online production step to crash. 


Once you have done the proper changes in your recast.yml file, you can just submit your job to REANA with the following command:

       recast submit analysis/ttH4tSSML --backend reana --tag  <your_tag>



The workflow will output the full folder of results as provided by TRexFitter with name  **recast_output**. You can download the full folder from REANA to check your results with the following command:


       reana-client  download -w recast-<your_tag> interpretation_step/recast_output
