# Function for solving the generalized eigenvalue problem Hv=ESv

function solveHS(num_params,fill_arrs,result_arrs,wf_bool) # actually this can be moved to common, or maybe to eigen2step.jl
    (;threshold) = num_params
    if wf_bool == 1
        eigen2step_valvec(result_arrs.energies_arr,result_arrs.wavefun_arr,fill_arrs.T,fill_arrs.S;threshold=threshold) # warum 10^-10?
    elseif wf_bool == 0
        eigen2step(result_arrs.energies_arr,fill_arrs.T,fill_arrs.S;threshold=threshold)#;threshold=10^-10)
    else
        println("Error in solveHS due to wf_bool: no output produced")
    end
end
