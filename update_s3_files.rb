    bucket_name='booksing-test'  #bucket name where jpgs are stored
    result2=Array.new  #array to hold the s3 urls

    s3=AWS::S3.new  #create the s3 object

    bucket=s3.buckets[bucket_name]
    bucket.objects.each do |o|
      if o.metadata['cardtype']=='pictxt'
        result2<<"https://s3.amazonaws.com/#{bucket_name}/#{o.key}"
      end
    end

ser_result2= Marshal.dump(result2)
File.open('./config/s3files.txt','w') {|f| f.write(ser_result2)}
