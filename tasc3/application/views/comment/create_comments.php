<!-- views/user_listing.php -->
<html>

<head>
    <title>COMMENT</title>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/style.css">
</head>

<body>
    <div class="container">
        <div class = 'title'>
            <h1 id='form_head'>Comment Listing</h1>
            <h2>CREATE COMMENT</h1>
        </div>
        <?php echo validation_errors(); ?>
        <?php echo form_open('comment/create'); ?>
        <div class='box-input'>
            <input class='name' type="text" name='name' placeholder='Name'>
            <input class='email' required type="email" name='email' placeholder='Email'>
            <textarea class='message' required type="textarea " name="comment" placeholder="Сomment" rows="3" cols="22"></textarea><br><br>
            <button class='btn' type='submit'>CREATE</button>
        </div>
        <?php echo form_close(); ?>

        <?php if (isset($results)) { ?>
            <table border="1" cellpadding="0" cellspacing="0">
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