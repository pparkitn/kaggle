{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "af08effe",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-02-24T03:02:26.540522Z",
     "iopub.status.busy": "2024-02-24T03:02:26.537724Z",
     "iopub.status.idle": "2024-02-24T03:02:27.791970Z",
     "shell.execute_reply": "2024-02-24T03:02:27.790121Z"
    },
    "papermill": {
     "duration": 1.264799,
     "end_time": "2024-02-24T03:02:27.795355",
     "exception": false,
     "start_time": "2024-02-24T03:02:26.530556",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.4     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [],
      "text/latex": [],
      "text/markdown": [],
      "text/plain": [
       "character(0)"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "a4ddffdc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-24T03:02:27.838999Z",
     "iopub.status.busy": "2024-02-24T03:02:27.805701Z",
     "iopub.status.idle": "2024-02-24T03:03:23.825578Z",
     "shell.execute_reply": "2024-02-24T03:03:23.823704Z"
    },
    "papermill": {
     "duration": 56.029757,
     "end_time": "2024-02-24T03:03:23.829315",
     "exception": false,
     "start_time": "2024-02-24T03:02:27.799558",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: pacman\n",
      "\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "\n",
      "randomizr installed\n",
      "\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“dependency ‘pbkrtest’ is not available”\n",
      "also installing the dependency ‘car’\n",
      "\n",
      "\n",
      "Warning message in utils::install.packages(package, ...):\n",
      "“installation of package ‘car’ had non-zero exit status”\n",
      "Warning message in utils::install.packages(package, ...):\n",
      "“installation of package ‘AER’ had non-zero exit status”\n",
      "Warning message in p_install(package, character.only = TRUE, ...):\n",
      "“”\n",
      "Warning message in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE, :\n",
      "“there is no package called ‘AER’”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“package ‘htmlTable’ is not available for this version of R\n",
      "‘htmlTable’ version 2.4.2 is in the repositories but depends on R (>= 4.1)\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Warning message in p_install(package, character.only = TRUE, ...):\n",
      "“”\n",
      "Warning message in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE, :\n",
      "“there is no package called ‘htmlTable’”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“package ‘Gmisc’ is not available for this version of R\n",
      "‘Gmisc’ version 3.0.3 is in the repositories but depends on R (>= 4.1.0)\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Warning message in p_install(package, character.only = TRUE, ...):\n",
      "“”\n",
      "Warning message in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE, :\n",
      "“there is no package called ‘Gmisc’”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“dependency ‘htmlTable’ is not available”\n",
      "Warning message in utils::install.packages(package, ...):\n",
      "“installation of package ‘Hmisc’ had non-zero exit status”\n",
      "Warning message in p_install(package, character.only = TRUE, ...):\n",
      "“”\n",
      "Warning message in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE, :\n",
      "“there is no package called ‘Hmisc’”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“package ‘rcompanion’ is not available for this version of R\n",
      "‘rcompanion’ version 2.4.35 is in the repositories but depends on R (>= 4.1.0)\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Warning message in p_install(package, character.only = TRUE, ...):\n",
      "“”\n",
      "Warning message in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE, :\n",
      "“there is no package called ‘rcompanion’”\n",
      "Warning message in pacman::p_load(dplyr, data.table, sandwich, lmtest, knitr, stargazer, :\n",
      "“Failed to install/load:\n",
      "AER, htmlTable, Gmisc, Hmisc, rcompanion”\n"
     ]
    }
   ],
   "source": [
    "if (!require(pacman)) install.packages('pacman', repos = 'https://cran.rstudio.com')\n",
    "pacman::p_load(dplyr, data.table, sandwich, lmtest, knitr, stargazer, \n",
    "               ggplot2, patchwork,randomizr,AER,foreign,DiagrammeR,cobalt,\n",
    "               magrittr,grid,htmlTable,glue,Gmisc,MatchIt,Hmisc,corrplot,\n",
    "               PerformanceAnalytics,rcompanion)\n",
    "options(dplyr.summarise.inform = FALSE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "ff2a283c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-24T03:03:23.844315Z",
     "iopub.status.busy": "2024-02-24T03:03:23.842797Z",
     "iopub.status.idle": "2024-02-24T03:03:23.920275Z",
     "shell.execute_reply": "2024-02-24T03:03:23.918517Z"
    },
    "papermill": {
     "duration": 0.086602,
     "end_time": "2024-02-24T03:03:23.922943",
     "exception": false,
     "start_time": "2024-02-24T03:03:23.836341",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(data.table)\n",
    "library(sandwich)\n",
    "library(lmtest)\n",
    "library(knitr)\n",
    "library(stargazer)\n",
    "library(randomizr)\n",
    "library(foreign)\n",
    "library(ggplot2)\n",
    "#library(AER)\n",
    "library(\"readxl\")\n",
    "library(DiagrammeR)\n",
    "#library(Gmisc, quietly = TRUE)\n",
    "library(glue)\n",
    "#library(htmlTable)\n",
    "library(grid)\n",
    "library(magrittr)\n",
    "library(cobalt)\n",
    "library(MatchIt)\n",
    "#library(Hmisc)\n",
    "library(corrplot)\n",
    "library(PerformanceAnalytics)\n",
    "#library(rcompanion)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "0e911ae7",
   "metadata": {
    "papermill": {
     "duration": 0.004349,
     "end_time": "2024-02-24T03:03:23.931965",
     "exception": false,
     "start_time": "2024-02-24T03:03:23.927616",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "7739c143",
   "metadata": {
    "papermill": {
     "duration": 0.004939,
     "end_time": "2024-02-24T03:03:23.941757",
     "exception": false,
     "start_time": "2024-02-24T03:03:23.936818",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "aa9afb2c",
   "metadata": {
    "papermill": {
     "duration": 0.004312,
     "end_time": "2024-02-24T03:03:23.950369",
     "exception": false,
     "start_time": "2024-02-24T03:03:23.946057",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "bde82041",
   "metadata": {
    "papermill": {
     "duration": 0.004224,
     "end_time": "2024-02-24T03:03:23.958897",
     "exception": false,
     "start_time": "2024-02-24T03:03:23.954673",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [],
   "dockerImageVersionId": 30618,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 61.00196,
   "end_time": "2024-02-24T03:03:24.085499",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-02-24T03:02:23.083539",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
