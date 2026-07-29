# Explore: explore_0032
# Auto-generated LookML Explore File

include: "/views/domain_47/view_00097.view.lkml"
include: "/views/domain_49/view_00099.view.lkml"
include: "/views/domain_50/view_00100.view.lkml"
include: "/views/domain_01/view_00101.view.lkml"

explore: explore_0032 {
  label: "Explore Explore 0032"
  description: "Comprehensive analytics explore joining base view_00097 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00097
  
  always_filter: {
    filters: [view_00097.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00097.created_at_date: "7 days"]
    unless: [view_00097.id, view_00097.status]
  }

  join: view_00099 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00097.user_id} = ${view_00099.id} ;;
    required_joins: []
  }

  join: view_00100 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00097.account_id} = ${view_00100.account_id} ;;
    required_joins: [view_00099]
  }

  join: view_00101 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00097.category} = ${view_00101.category} ;;
  }

  access_filter: {
    field: view_00097.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00097.is_deleted} = false ;;
}
