-- Replayable: an update of the module keeps this table, and the core's updater
-- applies this file again; the index is created only when missing.
SET @missing := (SELECT COUNT(*) = 0 FROM information_schema.STATISTICS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'mod_item_upgrade_stats' AND INDEX_NAME = 'idx_stat');
SET @sql := IF(@missing, 'CREATE UNIQUE INDEX `idx_stat` ON `mod_item_upgrade_stats` (`stat_type`, `stat_mod_pct`)', 'DO 0');
PREPARE item_upgrade_step FROM @sql; EXECUTE item_upgrade_step; DEALLOCATE PREPARE item_upgrade_step;
