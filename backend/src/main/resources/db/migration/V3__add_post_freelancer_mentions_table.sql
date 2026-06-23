CREATE TABLE IF NOT EXISTS post_freelancer_mentions (
    post_id              BIGINT NOT NULL,
    freelancer_profile_id BIGINT NOT NULL,
    PRIMARY KEY (post_id, freelancer_profile_id),
    CONSTRAINT fk_pfm_post    FOREIGN KEY (post_id)               REFERENCES posts(id),
    CONSTRAINT fk_pfm_profile FOREIGN KEY (freelancer_profile_id) REFERENCES freelancer_profiles(id)
);
