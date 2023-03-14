DELETE FROM CreatorsBoardgames
WHERE BoardgameId IN (
	SELECT Id FROM Boardgames
	WHERE PublisherId IN (
		SELECT Id 
		FROM Publishers
		WHERE AddressId IN (
			SELECT Id
			FROM Addresses
			WHERE Town LIKE 'L%'
		)
	)
);

DELETE FROM Boardgames
WHERE PublisherId IN (
	SELECT Id 
	FROM Publishers
	WHERE AddressId IN (
		SELECT Id
		FROM Addresses
		WHERE Town LIKE 'L%'
	)
);

DELETE FROM Publishers
WHERE AddressId IN (
	SELECT Id
	FROM Addresses
	WHERE Town LIKE 'L%'
);

DELETE FROM Addresses
WHERE Town LIKE 'L%';