# Explore: explore_1998
# Auto-generated LookML Explore File

include: "/views/domain_45/view_05995.view.lkml"
include: "/views/domain_47/view_05997.view.lkml"
include: "/views/domain_48/view_05998.view.lkml"
include: "/views/domain_49/view_05999.view.lkml"

explore: explore_1998 {
  label: "Explore Explore 1998"
  description: "Comprehensive analytics explore joining base view_05995 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05995
  
  always_filter: {
    filters: [view_05995.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05995.created_at_date: "7 days"]
    unless: [view_05995.id, view_05995.status]
  }

  join: view_05997 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05995.user_id} = ${view_05997.id} ;;
    required_joins: []
  }

  join: view_05998 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05995.account_id} = ${view_05998.account_id} ;;
    required_joins: [view_05997]
  }

  join: view_05999 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05995.category} = ${view_05999.category} ;;
  }

  access_filter: {
    field: view_05995.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05995.is_deleted} = false ;;
}
