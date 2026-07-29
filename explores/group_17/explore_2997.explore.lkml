# Explore: explore_2997
# Auto-generated LookML Explore File

include: "/views/domain_42/view_08992.view.lkml"
include: "/views/domain_44/view_08994.view.lkml"
include: "/views/domain_45/view_08995.view.lkml"
include: "/views/domain_46/view_08996.view.lkml"

explore: explore_2997 {
  label: "Explore Explore 2997"
  description: "Comprehensive analytics explore joining base view_08992 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08992
  
  always_filter: {
    filters: [view_08992.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08992.created_at_date: "7 days"]
    unless: [view_08992.id, view_08992.status]
  }

  join: view_08994 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08992.user_id} = ${view_08994.id} ;;
    required_joins: []
  }

  join: view_08995 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08992.account_id} = ${view_08995.account_id} ;;
    required_joins: [view_08994]
  }

  join: view_08996 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08992.category} = ${view_08996.category} ;;
  }

  access_filter: {
    field: view_08992.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08992.is_deleted} = false ;;
}
