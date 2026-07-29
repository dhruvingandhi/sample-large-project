# Explore: explore_0664
# Auto-generated LookML Explore File

include: "/views/domain_43/view_01993.view.lkml"
include: "/views/domain_45/view_01995.view.lkml"
include: "/views/domain_46/view_01996.view.lkml"
include: "/views/domain_47/view_01997.view.lkml"

explore: explore_0664 {
  label: "Explore Explore 0664"
  description: "Comprehensive analytics explore joining base view_01993 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01993
  
  always_filter: {
    filters: [view_01993.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01993.created_at_date: "7 days"]
    unless: [view_01993.id, view_01993.status]
  }

  join: view_01995 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01993.user_id} = ${view_01995.id} ;;
    required_joins: []
  }

  join: view_01996 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01993.account_id} = ${view_01996.account_id} ;;
    required_joins: [view_01995]
  }

  join: view_01997 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01993.category} = ${view_01997.category} ;;
  }

  access_filter: {
    field: view_01993.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01993.is_deleted} = false ;;
}
