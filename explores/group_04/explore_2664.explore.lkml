# Explore: explore_2664
# Auto-generated LookML Explore File

include: "/views/domain_43/view_07993.view.lkml"
include: "/views/domain_45/view_07995.view.lkml"
include: "/views/domain_46/view_07996.view.lkml"
include: "/views/domain_47/view_07997.view.lkml"

explore: explore_2664 {
  label: "Explore Explore 2664"
  description: "Comprehensive analytics explore joining base view_07993 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07993
  
  always_filter: {
    filters: [view_07993.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07993.created_at_date: "7 days"]
    unless: [view_07993.id, view_07993.status]
  }

  join: view_07995 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07993.user_id} = ${view_07995.id} ;;
    required_joins: []
  }

  join: view_07996 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07993.account_id} = ${view_07996.account_id} ;;
    required_joins: [view_07995]
  }

  join: view_07997 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07993.category} = ${view_07997.category} ;;
  }

  access_filter: {
    field: view_07993.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07993.is_deleted} = false ;;
}
