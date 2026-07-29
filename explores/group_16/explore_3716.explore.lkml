# Explore: explore_3716
# Auto-generated LookML Explore File

include: "/views/domain_49/view_11149.view.lkml"
include: "/views/domain_01/view_11151.view.lkml"
include: "/views/domain_02/view_11152.view.lkml"
include: "/views/domain_03/view_11153.view.lkml"

explore: explore_3716 {
  label: "Explore Explore 3716"
  description: "Comprehensive analytics explore joining base view_11149 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11149
  
  always_filter: {
    filters: [view_11149.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11149.created_at_date: "7 days"]
    unless: [view_11149.id, view_11149.status]
  }

  join: view_11151 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11149.user_id} = ${view_11151.id} ;;
    required_joins: []
  }

  join: view_11152 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11149.account_id} = ${view_11152.account_id} ;;
    required_joins: [view_11151]
  }

  join: view_11153 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11149.category} = ${view_11153.category} ;;
  }

  access_filter: {
    field: view_11149.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11149.is_deleted} = false ;;
}
