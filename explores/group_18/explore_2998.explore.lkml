# Explore: explore_2998
# Auto-generated LookML Explore File

include: "/views/domain_45/view_08995.view.lkml"
include: "/views/domain_47/view_08997.view.lkml"
include: "/views/domain_48/view_08998.view.lkml"
include: "/views/domain_49/view_08999.view.lkml"

explore: explore_2998 {
  label: "Explore Explore 2998"
  description: "Comprehensive analytics explore joining base view_08995 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08995
  
  always_filter: {
    filters: [view_08995.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08995.created_at_date: "7 days"]
    unless: [view_08995.id, view_08995.status]
  }

  join: view_08997 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08995.user_id} = ${view_08997.id} ;;
    required_joins: []
  }

  join: view_08998 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08995.account_id} = ${view_08998.account_id} ;;
    required_joins: [view_08997]
  }

  join: view_08999 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08995.category} = ${view_08999.category} ;;
  }

  access_filter: {
    field: view_08995.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08995.is_deleted} = false ;;
}
