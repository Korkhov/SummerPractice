function Test

end

function LinReg(x)
    kol_fac = length(x(1,:))-1;
    kol_isl = length(x(:,1));
    y = x(:,1);
    x(:,1) = 1;
    b = inv(x*x')*x*y;
    y_kr = x'*b;
    u = y-y_kr;
    u_2 = power(u,2);
    skvu = sum(u_2)/(kol_isl-kol_fac);
    MSE = sum(u_2)/kol_isl;
    M_u = sum(u)/kol_isl;
    MAPE = 0;
    for i = 1:kol_isl
        MAPE = MAPE + abs(u(i))/y(i);
    end
    MAPE = 100*MAPE/kol_isl;
    y_sr = sum(y)/kol_isl;
    temp = 0;
    for i = 1:kol_isl
        temp = temp+(y(i)-y_sr)*(y(i)-y_sr);
    end
    R_2 = 1-sum(u_2)/temp;
    R_2_T = 1-(1-R_2)*(kol_isl-1)/(kol_isl-kol_fac);
    for i = 2:kol_fac
        R(i-1) = corrcoef(x(:,i),y);
    end
    R;
end

