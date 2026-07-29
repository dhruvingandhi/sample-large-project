# Explore: explore_0033
# Auto-generated LookML Explore File

include: "/views/domain_50/view_00100.view.lkml"
include: "/views/domain_02/view_00102.view.lkml"
include: "/views/domain_03/view_00103.view.lkml"
include: "/views/domain_04/view_00104.view.lkml"

explore: explore_0033 {
  label: "Explore Explore 0033"
  description: "Comprehensive analytics explore joining base view_00100 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00100
  
  always_filter: {
    filters: [view_00100.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00100.created_at_date: "7 days"]
    unless: [view_00100.id, view_00100.status]
  }

  join: view_00102 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00100.user_id} = ${view_00102.id} ;;
    required_joins: []
  }

  join: view_00103 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00100.account_id} = ${view_00103.account_id} ;;
    required_joins: [view_00102]
  }

  join: view_00104 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00100.category} = ${view_00104.category} ;;
  }

  access_filter: {
    field: view_00100.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00100.is_deleted} = false ;;
}
