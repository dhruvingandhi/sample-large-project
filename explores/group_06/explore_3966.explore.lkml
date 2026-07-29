# Explore: explore_3966
# Auto-generated LookML Explore File

include: "/views/domain_49/view_11899.view.lkml"
include: "/views/domain_01/view_11901.view.lkml"
include: "/views/domain_02/view_11902.view.lkml"
include: "/views/domain_03/view_11903.view.lkml"

explore: explore_3966 {
  label: "Explore Explore 3966"
  description: "Comprehensive analytics explore joining base view_11899 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11899
  
  always_filter: {
    filters: [view_11899.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11899.created_at_date: "7 days"]
    unless: [view_11899.id, view_11899.status]
  }

  join: view_11901 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11899.user_id} = ${view_11901.id} ;;
    required_joins: []
  }

  join: view_11902 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11899.account_id} = ${view_11902.account_id} ;;
    required_joins: [view_11901]
  }

  join: view_11903 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11899.category} = ${view_11903.category} ;;
  }

  access_filter: {
    field: view_11899.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11899.is_deleted} = false ;;
}
