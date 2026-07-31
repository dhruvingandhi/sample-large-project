# Update for 2000 file diff target
# Explore: explore_2978
# Auto-generated LookML Explore File

include: "/views/domain_35/view_08935.view.lkml"
include: "/views/domain_37/view_08937.view.lkml"
include: "/views/domain_38/view_08938.view.lkml"
include: "/views/domain_39/view_08939.view.lkml"

explore: explore_2978 {
  label: "Explore Explore 2978"
  description: "Comprehensive analytics explore joining base view_08935 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08935
  
  always_filter: {
    filters: [view_08935.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08935.created_at_date: "7 days"]
    unless: [view_08935.id, view_08935.status]
  }

  join: view_08937 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08935.user_id} = ${view_08937.id} ;;
    required_joins: []
  }

  join: view_08938 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08935.account_id} = ${view_08938.account_id} ;;
    required_joins: [view_08937]
  }

  join: view_08939 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08935.category} = ${view_08939.category} ;;
  }

  access_filter: {
    field: view_08935.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08935.is_deleted} = false ;;
}
