<!-- views/user_listing.php -->
<html>

<head>
    <title>COMMENT</title>
</head>


<body>
    <div class="container">
        <h1 id='form_head'>Comment Listing</h1>
        <h1>CREATE COMMENT</h1>
        <?php echo validation_errors(); ?>
        <?php echo form_open('http://codeigniter3-example/comment/index'); ?>
            <p>NAME</p>
            <input type="text" name='name'>
            <p> EMAIL</p>
            <input required type="email" name='email'>
            <p> COMMENT</p>
            <textarea required type = "textarea " name="comment" placeholder = "Сomment" rows="3" cols="22"></textarea><br><br>
            <button type='submit'>CREATE</button>
        <?php echo form_close(); ?>

        <?php if (isset($results)) { ?>
            <table border="1" cellpadding="0" cellspacing="0" >
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Comment</th>
                </tr>

                <?php foreach ($results as $data) { ?>
                    <tr>
                        <td><?php echo $data->name ?></td>
                        <td><?php echo $data->email ?></td>
                        <td><?php echo $data->comment ?></td>
                    </tr>
                <?php } ?>
            </table>
        <?php } else { ?>
            <div>No user(s) found.</div>
        <?php } ?>

        <?php if (isset($links)) { ?>
            <?php echo $links ?>
        <?php } ?>
    </div>
</body>

</html>