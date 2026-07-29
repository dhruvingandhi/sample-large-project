# Explore: explore_3997
# Auto-generated LookML Explore File

include: "/views/domain_42/view_11992.view.lkml"
include: "/views/domain_44/view_11994.view.lkml"
include: "/views/domain_45/view_11995.view.lkml"
include: "/views/domain_46/view_11996.view.lkml"

explore: explore_3997 {
  label: "Explore Explore 3997"
  description: "Comprehensive analytics explore joining base view_11992 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11992
  
  always_filter: {
    filters: [view_11992.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11992.created_at_date: "7 days"]
    unless: [view_11992.id, view_11992.status]
  }

  join: view_11994 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11992.user_id} = ${view_11994.id} ;;
    required_joins: []
  }

  join: view_11995 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11992.account_id} = ${view_11995.account_id} ;;
    required_joins: [view_11994]
  }

  join: view_11996 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11992.category} = ${view_11996.category} ;;
  }

  access_filter: {
    field: view_11992.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11992.is_deleted} = false ;;
}
