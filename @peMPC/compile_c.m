function  compile_c(obj)
    % complile the c codes

    class_folder =  fileparts(mfilename('fullpath'));
    %mex([class_folder, filesep,'c_code/pempc_solve_couple_mex.c']...
    %    ,[class_folder, filesep,'c_code/pempc.c']...
    %    , '-R2017b','-lmwblas','-silent');
    %mex('-O','-LargeArrayDims','CFLAGS="$CFLAGS -fopenmp"','LDFLAGS="$LDFLAGS -fopenmp"','-R2017b','-lmwblas','-silent'...
    %    ,[class_folder, filesep,'c_code/pempc_solve_decouple_mex.c']...
    %    ,[class_folder, filesep,'c_code/pempc.c']...
    %    );
    if exist('pempc_get_control_mex.mexw64', 'file')
        delete('pempc_get_control_mex.mexw64');
    end
    mex('-O','-LargeArrayDims','CFLAGS="$CFLAGS -fopenmp"','LDFLAGS="$LDFLAGS -fopenmp"','-R2017b','-lmwblas','-silent'...
        ,[class_folder, filesep,'c_code/pempc_get_control_mex.c']...
        ,[class_folder, filesep,'c_code/pempc.c']...
        );
    fprintf("mex files compiled successfully.\n");
end %end of the function