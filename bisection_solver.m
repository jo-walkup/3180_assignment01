function [x,x_list] = bisection_solver(fun,x_left,x_right)
    x_mid=(x_left+x_right)/2;
    x_list=[];
    
    if (fun(x_left)<0 && fun(x_right)>0) || (fun(x_left)>0 && fun(x_right)<0)

        while abs(fun(x_mid))>(1*10^-14)
            
            if fun(x_left)>0 && fun(x_mid)<0 || fun(x_left)<0 && fun(x_mid)>0
                x_right=x_mid;
    
            else 
                x_left=x_mid;
            end
            
            x=x_mid;
            x_list(end+1)=x;
            
            x_mid=(x_left+x_right)/2;
           
    
            if abs(x-x_mid)<1*10^-14 && abs(fun(x_mid))<1*10^-14
                return
            end
        end 
    else
        x=0;
        return
    end
   
    return;
end