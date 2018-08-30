function file=cbtfp;

str = clipboard('paste');
if str(1)=='"';
str=str(2:end-1);
end
[pathstr, name, ext] = fileparts(str);
file=fullfile(pathstr,[name ext]);