-- RUN ONLY WHEN USING StoreParkinglotAccuratly
ALTER TABLE `player_vehicles`
ADD COLUMN `parkingspot` VARCHAR(200) NULL DEFAULT NULL AFTER `garage`;
