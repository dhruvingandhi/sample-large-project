# Explore: explore_3877
# Auto-generated LookML Explore File

include: "/views/domain_32/view_11632.view.lkml"
include: "/views/domain_34/view_11634.view.lkml"
include: "/views/domain_35/view_11635.view.lkml"
include: "/views/domain_36/view_11636.view.lkml"

explore: explore_3877 {
  label: "Explore Explore 3877"
  description: "Comprehensive analytics explore joining base view_11632 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11632
  
  always_filter: {
    filters: [view_11632.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11632.created_at_date: "7 days"]
    unless: [view_11632.id, view_11632.status]
  }

  join: view_11634 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11632.user_id} = ${view_11634.id} ;;
    required_joins: []
  }

  join: view_11635 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11632.account_id} = ${view_11635.account_id} ;;
    required_joins: [view_11634]
  }

  join: view_11636 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11632.category} = ${view_11636.category} ;;
  }

  access_filter: {
    field: view_11632.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11632.is_deleted} = false ;;
}
