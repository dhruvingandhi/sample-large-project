# Explore: explore_0342
# Auto-generated LookML Explore File

include: "/views/domain_27/view_01027.view.lkml"
include: "/views/domain_29/view_01029.view.lkml"
include: "/views/domain_30/view_01030.view.lkml"
include: "/views/domain_31/view_01031.view.lkml"

explore: explore_0342 {
  label: "Explore Explore 0342"
  description: "Comprehensive analytics explore joining base view_01027 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01027
  
  always_filter: {
    filters: [view_01027.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01027.created_at_date: "7 days"]
    unless: [view_01027.id, view_01027.status]
  }

  join: view_01029 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01027.user_id} = ${view_01029.id} ;;
    required_joins: []
  }

  join: view_01030 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01027.account_id} = ${view_01030.account_id} ;;
    required_joins: [view_01029]
  }

  join: view_01031 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01027.category} = ${view_01031.category} ;;
  }

  access_filter: {
    field: view_01027.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01027.is_deleted} = false ;;
}
