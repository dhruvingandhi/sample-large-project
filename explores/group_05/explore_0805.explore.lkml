# Antigravity modified: branch dg-3
# Explore: explore_0805
# Auto-generated LookML Explore File

include: "/views/domain_16/view_02416.view.lkml"
include: "/views/domain_18/view_02418.view.lkml"
include: "/views/domain_19/view_02419.view.lkml"
include: "/views/domain_20/view_02420.view.lkml"

explore: explore_0805 {
  label: "Explore Explore 0805"
  description: "Comprehensive analytics explore joining base view_02416 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02416
  
  always_filter: {
    filters: [view_02416.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02416.created_at_date: "7 days"]
    unless: [view_02416.id, view_02416.status]
  }

  join: view_02418 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02416.user_id} = ${view_02418.id} ;;
    required_joins: []
  }

  join: view_02419 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02416.account_id} = ${view_02419.account_id} ;;
    required_joins: [view_02418]
  }

  join: view_02420 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02416.category} = ${view_02420.category} ;;
  }

  access_filter: {
    field: view_02416.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02416.is_deleted} = false ;;
}
