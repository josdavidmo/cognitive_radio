function distribution = distribution_towers(quantity,towers,random)
    if random
        n=quantity;
        m=1:n;
        a=m(sort(randperm(quantity,towers)));
        array=diff(a);
        array(end+1)=quantity-sum(array);
        distribution = [1];
        for i = 1:towers-1
            distribution = [distribution,distribution(i)+array(i)];
        end        
    else
        n= round(quantity/towers);
        distribution = [1];
        for i = 1:towers-1
            distribution = [distribution,distribution(i)+n];
        end
    end
    distribution = [distribution,quantity+1];
end