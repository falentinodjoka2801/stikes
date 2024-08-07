<!DOCTYPE html>
<html>

<head>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 4px 0px;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            width: 50%;
            text-align: center;
            vertical-align: top;
        }

        td img {
            margin: 0px auto;
            max-width: 65px;
        }

        td h6 {
            margin: 0;
            margin-top: 5px;
            font-size: 12px;
        }
    </style>
</head>

<body>
    <table border='0' style='width: 100%;'>
        @foreach ($listItems as $row)
            <tr>
                <td>
                    <img src="https://barcode.tec-it.com/barcode.ashx?data={{ $row->kode }}&code=QRCode&translate-esc=on&dpi=&eclevel=L"
                        alt="{{ $row->kode }}" style='margin-top: 5px;'>
                    <p style='font-size: 10px; margin-top: 0px;'>
                        {{ $row->nama }}
                    </p>
                </td>
                <td>
                    <img src="https://barcode.tec-it.com/barcode.ashx?data={{ $row->kode }}&code=QRCode&translate-esc=on&dpi=&eclevel=L"
                        alt="{{ $row->kode }}" style='margin-top: 5px;'>
                    <p style='font-size: 10px; margin-top: 0px;'>
                        {{ $row->nama }}
                    </p>
                </td>
            </tr>
        @endforeach
    </table>
</body>
</html>
<script language='Javascript'>
    print();
</script>