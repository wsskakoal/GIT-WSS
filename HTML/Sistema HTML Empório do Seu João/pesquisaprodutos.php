<?php

?>
<head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet" />
        <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
</head> 



<?php
$conecta = new mysqli("localhost","kinyxapp_app","12345","kinyxapp_wyllian");
if (!$conecta) die ("<h1>Falha na coneco com o Banco de Dados!</h1>");
$sql = "SELECT *  FROM produto";
$query = mysqli_query($conecta, $sql);
$qtde = mysqli_num_rows($query);
?>
    <table id="example" class="display" style="width:100%">
      <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Tiger Nixon</td>
                <td>System Architect</td>
                <td>Edinburgh</td>
                <td>61</td>
                <td>2011/04/25</td>
                <td>$320,800</td>
            </tr>



            <?php
             while($linha = mysqli_fetch_array($query))
             {
               echo '<tr>';
               echo '<td> '.$linha['descricao'] . '</td>';
               echo '<td> '.$linha['statuspro'] . '</td>';
               echo '<td> '.$linha['saldo'] . '</td>';
               echo '</tr>';
             }
            ?>
        </tbody>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
    </table>
    </html>

    
    <script type="text/javascript"> $(document).ready(function() {
        $('#example').DataTable();
    } );</script>