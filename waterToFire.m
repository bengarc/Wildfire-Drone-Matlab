%%function takes in drone struct positionand fire matrix in order to to make one
%%point from the water to make intensity at a point zero

function  newMatrix = waterToFire(fireMatrix, dronePosition, droneAmount, n)
    newMatrix = fireMatrix;
    for ii = 1:length(fireMatrix(1,:))
        for kk = 1:length(fireMatrix(:,1))
            if dronePosition == [ii,kk] 
                newMatrix(ii, kk) = 0.1*fireMatrix(ii, kk);
                    if (ii - 1) ~= 0 && (kk - 1) ~= 0
                        newMatrix(ii - 1, kk - 1) = 0.25*fireMatrix(ii, kk);
                        newMatrix(ii - 1, kk) = 0.25*fireMatrix(ii, kk);
                        newMatrix(ii, kk - 1) = 0.25*fireMatrix(ii, kk);
                    end
                newMatrix(ii + 1, kk) = 0.25*fireMatrix(ii, kk);
                newMatrix(ii, kk + 1) = 0.25*fireMatrix(ii, kk);
                newMatrix(ii + 1, kk + 1) = 0.25*fireMatrix(ii, kk);
            end

        end
    end
    droneAmount = 0;
end
