require 'uri'

class CallbackVerifier

  # @param [request] A Rails request object
  # @param [api_key] The API key used to sign the request
  # @return [boolean] True if verified
  def verify_callback(request, api_key)
    url = url_for(:only_path => false, :overwrite_params=>nil)

    # Sort and join the parameters
    parameter_string = request
      .query_parameters
      .to_a
      .concat(request.request_parameters.to_a)
      .sort
      .map{ |p| p.join('=')}
      .join('&')

    parameter_string = URI.encode(parameter_string)

    # Read the nonce from the request
    nonce = request.headers['x-authy-signature-nonce']

    # Join all request parts using '|'
    data = "#{nonce}|#{request.method}|#{url}|#{parameter_string}"

    # Compute the signature
    digest = OpenSSL::Digest.new('sha256')
    hmac = OpenSSL::HMAC.digest(digest, api_key, data)
    hash = Base64.encode64(hmac)

    # Extract the actual request signature
    signature = request.headers['x-authy-signature']

    # Compare the computed signature with the actual signature
    hash == signature
  end
end
