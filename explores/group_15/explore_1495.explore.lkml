# Explore: explore_1495
# Auto-generated LookML Explore File

include: "/views/domain_36/view_04486.view.lkml"
include: "/views/domain_38/view_04488.view.lkml"
include: "/views/domain_39/view_04489.view.lkml"
include: "/views/domain_40/view_04490.view.lkml"

explore: explore_1495 {
  label: "Explore Explore 1495"
  description: "Comprehensive analytics explore joining base view_04486 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04486
  
  always_filter: {
    filters: [view_04486.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04486.created_at_date: "7 days"]
    unless: [view_04486.id, view_04486.status]
  }

  join: view_04488 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04486.user_id} = ${view_04488.id} ;;
    required_joins: []
  }

  join: view_04489 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04486.account_id} = ${view_04489.account_id} ;;
    required_joins: [view_04488]
  }

  join: view_04490 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04486.category} = ${view_04490.category} ;;
  }

  access_filter: {
    field: view_04486.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04486.is_deleted} = false ;;
}
