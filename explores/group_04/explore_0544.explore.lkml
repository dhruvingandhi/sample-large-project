# Explore: explore_0544
# Auto-generated LookML Explore File

include: "/views/domain_33/view_01633.view.lkml"
include: "/views/domain_35/view_01635.view.lkml"
include: "/views/domain_36/view_01636.view.lkml"
include: "/views/domain_37/view_01637.view.lkml"

explore: explore_0544 {
  label: "Explore Explore 0544"
  description: "Comprehensive analytics explore joining base view_01633 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01633
  
  always_filter: {
    filters: [view_01633.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01633.created_at_date: "7 days"]
    unless: [view_01633.id, view_01633.status]
  }

  join: view_01635 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01633.user_id} = ${view_01635.id} ;;
    required_joins: []
  }

  join: view_01636 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01633.account_id} = ${view_01636.account_id} ;;
    required_joins: [view_01635]
  }

  join: view_01637 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01633.category} = ${view_01637.category} ;;
  }

  access_filter: {
    field: view_01633.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01633.is_deleted} = false ;;
}
