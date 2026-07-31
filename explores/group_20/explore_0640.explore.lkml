# Update for 2000 file diff target
# Explore: explore_0640
# Auto-generated LookML Explore File

include: "/views/domain_21/view_01921.view.lkml"
include: "/views/domain_23/view_01923.view.lkml"
include: "/views/domain_24/view_01924.view.lkml"
include: "/views/domain_25/view_01925.view.lkml"

explore: explore_0640 {
  label: "Explore Explore 0640"
  description: "Comprehensive analytics explore joining base view_01921 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01921
  
  always_filter: {
    filters: [view_01921.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01921.created_at_date: "7 days"]
    unless: [view_01921.id, view_01921.status]
  }

  join: view_01923 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01921.user_id} = ${view_01923.id} ;;
    required_joins: []
  }

  join: view_01924 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01921.account_id} = ${view_01924.account_id} ;;
    required_joins: [view_01923]
  }

  join: view_01925 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01921.category} = ${view_01925.category} ;;
  }

  access_filter: {
    field: view_01921.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01921.is_deleted} = false ;;
}
