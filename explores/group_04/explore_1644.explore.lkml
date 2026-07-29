# Explore: explore_1644
# Auto-generated LookML Explore File

include: "/views/domain_33/view_04933.view.lkml"
include: "/views/domain_35/view_04935.view.lkml"
include: "/views/domain_36/view_04936.view.lkml"
include: "/views/domain_37/view_04937.view.lkml"

explore: explore_1644 {
  label: "Explore Explore 1644"
  description: "Comprehensive analytics explore joining base view_04933 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04933
  
  always_filter: {
    filters: [view_04933.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04933.created_at_date: "7 days"]
    unless: [view_04933.id, view_04933.status]
  }

  join: view_04935 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04933.user_id} = ${view_04935.id} ;;
    required_joins: []
  }

  join: view_04936 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04933.account_id} = ${view_04936.account_id} ;;
    required_joins: [view_04935]
  }

  join: view_04937 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04933.category} = ${view_04937.category} ;;
  }

  access_filter: {
    field: view_04933.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04933.is_deleted} = false ;;
}
