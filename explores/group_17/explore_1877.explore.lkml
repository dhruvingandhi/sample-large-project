# Explore: explore_1877
# Auto-generated LookML Explore File

include: "/views/domain_32/view_05632.view.lkml"
include: "/views/domain_34/view_05634.view.lkml"
include: "/views/domain_35/view_05635.view.lkml"
include: "/views/domain_36/view_05636.view.lkml"

explore: explore_1877 {
  label: "Explore Explore 1877"
  description: "Comprehensive analytics explore joining base view_05632 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05632
  
  always_filter: {
    filters: [view_05632.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05632.created_at_date: "7 days"]
    unless: [view_05632.id, view_05632.status]
  }

  join: view_05634 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05632.user_id} = ${view_05634.id} ;;
    required_joins: []
  }

  join: view_05635 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05632.account_id} = ${view_05635.account_id} ;;
    required_joins: [view_05634]
  }

  join: view_05636 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05632.category} = ${view_05636.category} ;;
  }

  access_filter: {
    field: view_05632.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05632.is_deleted} = false ;;
}
