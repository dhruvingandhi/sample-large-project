# Explore: explore_0003
# Auto-generated LookML Explore File

include: "/views/domain_10/view_00010.view.lkml"
include: "/views/domain_12/view_00012.view.lkml"
include: "/views/domain_13/view_00013.view.lkml"
include: "/views/domain_14/view_00014.view.lkml"

explore: explore_0003 {
  label: "Explore Explore 0003"
  description: "Comprehensive analytics explore joining base view_00010 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00010
  
  always_filter: {
    filters: [view_00010.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00010.created_at_date: "7 days"]
    unless: [view_00010.id, view_00010.status]
  }

  join: view_00012 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00010.user_id} = ${view_00012.id} ;;
    required_joins: []
  }

  join: view_00013 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00010.account_id} = ${view_00013.account_id} ;;
    required_joins: [view_00012]
  }

  join: view_00014 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00010.category} = ${view_00014.category} ;;
  }

  access_filter: {
    field: view_00010.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00010.is_deleted} = false ;;
}
