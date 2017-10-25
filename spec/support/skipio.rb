RSpec.shared_context :skipio_webmocks do
  before(:each) do
    WebMock.stub_request(:any, /contacts/).to_return(status: 200, body: {
      data: {
        id: '6e922472-41f6-4bbc-907f-44a2b6073ccc',
        message_list_id: 'f5ebbd6c-4ae5-456f-a6d3-d3348401229e',
        is_conversing: false,
        is_sms_enabled: true,
        is_sms_blacklisted: false,
        email: 'anika.nilles@test.com',
        phone_mobile: '+14355551351',
        phone_mobile_national: '(435) 555-1351',
        phone_mobile_international: '+1 435-555-1351',
        is_skipio_phone_number: false,
        first_name: 'Anika',
        last_name: 'Nilles',
        full_name: 'Anika Nilles',
        sort_name: 'nilles anika 14355551351',
        company_name: nil,
        initial: 'N',
        initials: 'AN',
        is_starred: false,
        is_unread: false,
        is_invalid_phone_number: false,
        invalid_reason: nil,
        birth_date: nil,
        street_address: '123 N Main St',
        city: 'St. George',
        state: 'UT',
        zip_code: '84123',
        birth_month: 3,
        birth_day: 13,
        is_deleted: false,
        deleted_at: nil,
        avatar_url: 'https://www.gravatar.com/avatar/bc86cf54bd14594d8d41b6afcb4e964a?d=https%3A%2F%2Favatars.io%2Ftwitter%2Fusername',
        url: 'http://app.skipio.com/api/v2/contacts/6e922472-41f6-4bbc-907f-44a2b6073ccc',
        custom_field_1: '',
        custom_field_2: '',
        custom_field_3: '',
        campaigns_count: 0,
        contact_groups_count: 0,
        delivered_outbound_message_count: 0,
        inbound_message_count: 0,
        outbound_to_inbound_message_ratio: 0.5,
        most_recent_inbound_message_created_at: nil,
        most_recent_enqueued_or_delivered_message_created_at: nil,
        contact_group_ids: {},
        campaign_ids: {}
      }
    }.to_json, headers: {})

    WebMock.stub_request(:post, /messages/).to_return(status: 201, body: '', headers: {})
  end
end