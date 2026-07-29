# Explore: explore_0179
# Auto-generated LookML Explore File

include: "/views/domain_38/view_00538.view.lkml"
include: "/views/domain_40/view_00540.view.lkml"
include: "/views/domain_41/view_00541.view.lkml"
include: "/views/domain_42/view_00542.view.lkml"

explore: explore_0179 {
  label: "Explore Explore 0179"
  description: "Comprehensive analytics explore joining base view_00538 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00538
  
  always_filter: {
    filters: [view_00538.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00538.created_at_date: "7 days"]
    unless: [view_00538.id, view_00538.status]
  }

  join: view_00540 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00538.user_id} = ${view_00540.id} ;;
    required_joins: []
  }

  join: view_00541 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00538.account_id} = ${view_00541.account_id} ;;
    required_joins: [view_00540]
  }

  join: view_00542 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00538.category} = ${view_00542.category} ;;
  }

  access_filter: {
    field: view_00538.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00538.is_deleted} = false ;;
}
