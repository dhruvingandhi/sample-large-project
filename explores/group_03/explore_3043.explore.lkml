# Explore: explore_3043
# Auto-generated LookML Explore File

include: "/views/domain_30/view_09130.view.lkml"
include: "/views/domain_32/view_09132.view.lkml"
include: "/views/domain_33/view_09133.view.lkml"
include: "/views/domain_34/view_09134.view.lkml"

explore: explore_3043 {
  label: "Explore Explore 3043"
  description: "Comprehensive analytics explore joining base view_09130 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09130
  
  always_filter: {
    filters: [view_09130.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09130.created_at_date: "7 days"]
    unless: [view_09130.id, view_09130.status]
  }

  join: view_09132 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09130.user_id} = ${view_09132.id} ;;
    required_joins: []
  }

  join: view_09133 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09130.account_id} = ${view_09133.account_id} ;;
    required_joins: [view_09132]
  }

  join: view_09134 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09130.category} = ${view_09134.category} ;;
  }

  access_filter: {
    field: view_09130.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09130.is_deleted} = false ;;
}
