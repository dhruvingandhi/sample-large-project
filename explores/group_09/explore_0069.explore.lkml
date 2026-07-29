# Explore: explore_0069
# Auto-generated LookML Explore File

include: "/views/domain_08/view_00208.view.lkml"
include: "/views/domain_10/view_00210.view.lkml"
include: "/views/domain_11/view_00211.view.lkml"
include: "/views/domain_12/view_00212.view.lkml"

explore: explore_0069 {
  label: "Explore Explore 0069"
  description: "Comprehensive analytics explore joining base view_00208 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00208
  
  always_filter: {
    filters: [view_00208.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00208.created_at_date: "7 days"]
    unless: [view_00208.id, view_00208.status]
  }

  join: view_00210 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00208.user_id} = ${view_00210.id} ;;
    required_joins: []
  }

  join: view_00211 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00208.account_id} = ${view_00211.account_id} ;;
    required_joins: [view_00210]
  }

  join: view_00212 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00208.category} = ${view_00212.category} ;;
  }

  access_filter: {
    field: view_00208.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00208.is_deleted} = false ;;
}
