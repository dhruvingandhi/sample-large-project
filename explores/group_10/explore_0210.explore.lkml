# Explore: explore_0210
# Auto-generated LookML Explore File

include: "/views/domain_31/view_00631.view.lkml"
include: "/views/domain_33/view_00633.view.lkml"
include: "/views/domain_34/view_00634.view.lkml"
include: "/views/domain_35/view_00635.view.lkml"

explore: explore_0210 {
  label: "Explore Explore 0210"
  description: "Comprehensive analytics explore joining base view_00631 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00631
  
  always_filter: {
    filters: [view_00631.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00631.created_at_date: "7 days"]
    unless: [view_00631.id, view_00631.status]
  }

  join: view_00633 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00631.user_id} = ${view_00633.id} ;;
    required_joins: []
  }

  join: view_00634 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00631.account_id} = ${view_00634.account_id} ;;
    required_joins: [view_00633]
  }

  join: view_00635 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00631.category} = ${view_00635.category} ;;
  }

  access_filter: {
    field: view_00631.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00631.is_deleted} = false ;;
}
