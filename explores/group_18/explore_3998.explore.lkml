# Explore: explore_3998
# Auto-generated LookML Explore File

include: "/views/domain_45/view_11995.view.lkml"
include: "/views/domain_47/view_11997.view.lkml"
include: "/views/domain_48/view_11998.view.lkml"
include: "/views/domain_49/view_11999.view.lkml"

explore: explore_3998 {
  label: "Explore Explore 3998"
  description: "Comprehensive analytics explore joining base view_11995 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11995
  
  always_filter: {
    filters: [view_11995.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11995.created_at_date: "7 days"]
    unless: [view_11995.id, view_11995.status]
  }

  join: view_11997 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11995.user_id} = ${view_11997.id} ;;
    required_joins: []
  }

  join: view_11998 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11995.account_id} = ${view_11998.account_id} ;;
    required_joins: [view_11997]
  }

  join: view_11999 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11995.category} = ${view_11999.category} ;;
  }

  access_filter: {
    field: view_11995.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11995.is_deleted} = false ;;
}
