# Update for 2000 file diff target
# Explore: explore_0978
# Auto-generated LookML Explore File

include: "/views/domain_35/view_02935.view.lkml"
include: "/views/domain_37/view_02937.view.lkml"
include: "/views/domain_38/view_02938.view.lkml"
include: "/views/domain_39/view_02939.view.lkml"

explore: explore_0978 {
  label: "Explore Explore 0978"
  description: "Comprehensive analytics explore joining base view_02935 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02935
  
  always_filter: {
    filters: [view_02935.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02935.created_at_date: "7 days"]
    unless: [view_02935.id, view_02935.status]
  }

  join: view_02937 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02935.user_id} = ${view_02937.id} ;;
    required_joins: []
  }

  join: view_02938 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02935.account_id} = ${view_02938.account_id} ;;
    required_joins: [view_02937]
  }

  join: view_02939 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02935.category} = ${view_02939.category} ;;
  }

  access_filter: {
    field: view_02935.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02935.is_deleted} = false ;;
}
