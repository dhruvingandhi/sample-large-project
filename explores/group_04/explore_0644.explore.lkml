# Explore: explore_0644
# Auto-generated LookML Explore File

include: "/views/domain_33/view_01933.view.lkml"
include: "/views/domain_35/view_01935.view.lkml"
include: "/views/domain_36/view_01936.view.lkml"
include: "/views/domain_37/view_01937.view.lkml"

explore: explore_0644 {
  label: "Explore Explore 0644"
  description: "Comprehensive analytics explore joining base view_01933 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01933
  
  always_filter: {
    filters: [view_01933.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01933.created_at_date: "7 days"]
    unless: [view_01933.id, view_01933.status]
  }

  join: view_01935 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01933.user_id} = ${view_01935.id} ;;
    required_joins: []
  }

  join: view_01936 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01933.account_id} = ${view_01936.account_id} ;;
    required_joins: [view_01935]
  }

  join: view_01937 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01933.category} = ${view_01937.category} ;;
  }

  access_filter: {
    field: view_01933.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01933.is_deleted} = false ;;
}
