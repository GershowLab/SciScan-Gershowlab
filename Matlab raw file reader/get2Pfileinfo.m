function [pathstr, filenameWOext,xpixels,ypixels,aqu_freq,framecount]=get2Pfileinfo(file)

[pathstr, filenameWOext] = fileparts(file);
inifilename=[filenameWOext '.ini'];
inistring=fileread(fullfile(pathstr,inifilename));
xpixels=readVarIni(inistring,'x.pixels');
ypixels=readVarIni(inistring,'y.pixels');
aqu_freq=readVarIni(inistring,'frames.p.sec');
framecount=readVarIni(inistring,'no..of.frames.to.acquire');

