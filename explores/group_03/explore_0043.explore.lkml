# Explore: explore_0043
# Auto-generated LookML Explore File

include: "/views/domain_30/view_00130.view.lkml"
include: "/views/domain_32/view_00132.view.lkml"
include: "/views/domain_33/view_00133.view.lkml"
include: "/views/domain_34/view_00134.view.lkml"

explore: explore_0043 {
  label: "Explore Explore 0043"
  description: "Comprehensive analytics explore joining base view_00130 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00130
  
  always_filter: {
    filters: [view_00130.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00130.created_at_date: "7 days"]
    unless: [view_00130.id, view_00130.status]
  }

  join: view_00132 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00130.user_id} = ${view_00132.id} ;;
    required_joins: []
  }

  join: view_00133 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00130.account_id} = ${view_00133.account_id} ;;
    required_joins: [view_00132]
  }

  join: view_00134 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00130.category} = ${view_00134.category} ;;
  }

  access_filter: {
    field: view_00130.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00130.is_deleted} = false ;;
}
