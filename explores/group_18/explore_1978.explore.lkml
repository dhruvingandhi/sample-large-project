# Explore: explore_1978
# Auto-generated LookML Explore File

include: "/views/domain_35/view_05935.view.lkml"
include: "/views/domain_37/view_05937.view.lkml"
include: "/views/domain_38/view_05938.view.lkml"
include: "/views/domain_39/view_05939.view.lkml"

explore: explore_1978 {
  label: "Explore Explore 1978"
  description: "Comprehensive analytics explore joining base view_05935 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05935
  
  always_filter: {
    filters: [view_05935.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05935.created_at_date: "7 days"]
    unless: [view_05935.id, view_05935.status]
  }

  join: view_05937 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05935.user_id} = ${view_05937.id} ;;
    required_joins: []
  }

  join: view_05938 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05935.account_id} = ${view_05938.account_id} ;;
    required_joins: [view_05937]
  }

  join: view_05939 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05935.category} = ${view_05939.category} ;;
  }

  access_filter: {
    field: view_05935.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05935.is_deleted} = false ;;
}
