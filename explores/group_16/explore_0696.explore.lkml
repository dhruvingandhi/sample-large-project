# Explore: explore_0696
# Auto-generated LookML Explore File

include: "/views/domain_39/view_02089.view.lkml"
include: "/views/domain_41/view_02091.view.lkml"
include: "/views/domain_42/view_02092.view.lkml"
include: "/views/domain_43/view_02093.view.lkml"

explore: explore_0696 {
  label: "Explore Explore 0696"
  description: "Comprehensive analytics explore joining base view_02089 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02089
  
  always_filter: {
    filters: [view_02089.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02089.created_at_date: "7 days"]
    unless: [view_02089.id, view_02089.status]
  }

  join: view_02091 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02089.user_id} = ${view_02091.id} ;;
    required_joins: []
  }

  join: view_02092 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02089.account_id} = ${view_02092.account_id} ;;
    required_joins: [view_02091]
  }

  join: view_02093 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02089.category} = ${view_02093.category} ;;
  }

  access_filter: {
    field: view_02089.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02089.is_deleted} = false ;;
}
