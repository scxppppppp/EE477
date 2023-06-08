ssh -x -y wufei@viterbi-scf2.usc.edu
ssh -N -f -L localhost:8000:localhost:15029 wufei@viterbi-scf2.usc.edu（use windows powershell） 
vncserver -geometry 1920x1080
source setup_ee477_ee577a_v2101.csh (if you had not included in your '.cshrc' file)
cd work_gpdk045
fvwm & (for convinience i.e. optional)
virtuoso &