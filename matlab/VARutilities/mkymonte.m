function montey = mkymonte(y,coefs,errmonte)

errmonte=errmonte';

nvars = size(y,2);
nobs = size(y,1);
montey = y';

[cofb,const_b]=ols2ar(coefs,1,0);

nlags = size(cofb,3);
for obs=nlags+1:nobs
        montey(:,obs) = errmonte(:,obs-nlags)+const_b;
        for k=1:nlags
            montey(:,obs) = montey(:,obs)+cofb(:,:,k)*montey(:,obs-k);
        end 
end

montey=montey';