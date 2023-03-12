%This script goes through the list of files and changes their names 
%Written by Kavya Ummethala 
%2/15/21
%Get a struct array of all the *.jpg files
ImageStruct=dir('*.jpg');
n=length(ImageStruct);
for i=1:n;
    %read in image
    rawimg= imread(ImageStruct(i).name);
    %image(rawimg)
    %read in the file name
    f_name=ImageStruct(i).name;
    
    %Read the number part of the file name
    f_name_number=f_name(5:8);
    
    %convert the above from Srting to number
    f_name_int=str2num(f_name_number);
    
    if((f_name_int>4650)&(f_name_int<4801))
        outfilename=['MustardOil',f_name_number,'.jpg'];
        imwrite(rawimg,outfilename);
        
    end
    
    if((f_name_int>4803)&(f_name_int<4954))
        outfilename=['SesameOil',f_name_number,'.jpg'];
        imwrite(rawimg,outfilename);
    end
    
    if((f_name_int>4953)&(f_name_int<5105))
        outfilename=['AvocadoOil',f_name_number,'.jpg'];
        imwrite(rawimg,outfilename);
    end
    
    if((f_name_int>5104)&(f_name_int<5255))
        outfilename=['OliveOil',f_name_number,'.jpg'];
        imwrite(rawimg,outfilename);
    end
    
    if((f_name_int>5254)&(f_name_int<5405))
        outfilename=['PeanutOil',f_name_number,'.jpg'];
        imwrite(rawimg,outfilename);
    end
    
   %delete(f_name)
   
end 