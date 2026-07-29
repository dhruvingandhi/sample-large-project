# Explore: explore_3937
# Auto-generated LookML Explore File

include: "/views/domain_12/view_11812.view.lkml"
include: "/views/domain_14/view_11814.view.lkml"
include: "/views/domain_15/view_11815.view.lkml"
include: "/views/domain_16/view_11816.view.lkml"

explore: explore_3937 {
  label: "Explore Explore 3937"
  description: "Comprehensive analytics explore joining base view_11812 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11812
  
  always_filter: {
    filters: [view_11812.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11812.created_at_date: "7 days"]
    unless: [view_11812.id, view_11812.status]
  }

  join: view_11814 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11812.user_id} = ${view_11814.id} ;;
    required_joins: []
  }

  join: view_11815 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11812.account_id} = ${view_11815.account_id} ;;
    required_joins: [view_11814]
  }

  join: view_11816 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11812.category} = ${view_11816.category} ;;
  }

  access_filter: {
    field: view_11812.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11812.is_deleted} = false ;;
}
