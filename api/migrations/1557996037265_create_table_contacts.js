module.exports = {
    "up": `INSERT INTO contacts (name, number, email) VALUES
        ('Josip Volarevic','098662672','josip312@hotmail.com'),
        ('Mirjam Ozretic', '0986544822', 'ozreticm@gmail.com'),
        ('Ante Antic', '099675324', 'ante.antic@gmail.com'),
        ('Damir Družeic', '091225687', 'DamirPro@yahoo.com'),
        ('Ana Siljeg','097221987', 'Siljkolino@live.com'),
        ('Butik In', '097224351', 'Butik@in.com'),
        ('Ivan Ivic', '097235457', 'Ivan.ivic@gmail.com'),
        ('Jure Juric', '0953489743', 'Jure.juric@gmail.com'),
        ('Karlo Karlic', '0973459348', 'Karlo.karlic@gmail.com'),
        ('Mate Matic', '0918347832', 'Mate.matic@gmail.com'),
        ('Pero Peric', '091239872', 'Pero.peric@gmail.com');`,
    "down": "DELETE FROM contacts"
}
