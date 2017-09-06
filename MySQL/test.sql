SELECT 
    ur.U_ID, ur.R_ID, u.username, account
FROM
    eba_user.t_ref_role_user ur

LEFT JOIN (SELECT * FROM eba_user.t_user) u on u.U_ID=ur.U_ID; 