update CONTRACT_SITUATION set HAS_MANDATORY_CREDITS=1, GIVE_CREDITS=1 where END_SITUATION=0 and SERVICE_EXEMPTION=1 and IN_EXERCISE=1 and MUST_HAVE_ASSOCIATED_EXEMPTION=0;
