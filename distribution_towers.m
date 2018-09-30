function [distribution,distribution_text] = distribution_towers(quantity,towers,random)
    distribution_text = "";
    if random
        n=quantity;
        m=1:n;
        a=m(sort(randperm(quantity,towers)));
        array=diff(a);
        array(end+1)=quantity-sum(array);
        distribution = [1];        
        for i = 1:towers-1
            distribution = [distribution,distribution(i)+array(i)];
            distribution_text = strcat(distribution_text,",",strcat(int2str(distribution(i))," A ",int2str(distribution(i+1)-1)));
        end        
    else
        n= round(quantity/towers);
        distribution = [1];
        for i = 1:towers-1
            distribution = [distribution,distribution(i)+n];
            distribution_text = strcat(distribution_text,",",strcat(int2str(distribution(i))," A ",int2str(distribution(i+1)-1)));
        end
    end
    distribution = [distribution,quantity+1];
end