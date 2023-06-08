newdir=work_gpdk045
mkdir ~/${newdir}
mkdir ~/${newdir}/LVS
mkdir ~/${newdir}/DRC
cd ~/${newdir}

echo 'include ~ee577/CDS_GPDK45/gpdk045_v_5_0/cds.lib' >> ~/${newdir}/cds.lib
echo 'include ~ee577/CDS_GPDK45/gsclib045_svt_mini_v4.4/cds.lib' >> ~/${newdir}/cds.lib

cp ~ee577/CDS_GPDK45/gpdk045_v_5_0/pvtech.lib ~/${newdir}/
cp -r ~ee577/CDS_GPDK45/gpdk045_v_5_0/pvs ~/${newdir}/
cp -r ~ee577/CDS_GPDK45/gpdk045_v_5_0/diva ~/${newdir}/
