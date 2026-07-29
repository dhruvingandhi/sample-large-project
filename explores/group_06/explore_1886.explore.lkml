# Explore: explore_1886
# Auto-generated LookML Explore File

include: "/views/domain_09/view_05659.view.lkml"
include: "/views/domain_11/view_05661.view.lkml"
include: "/views/domain_12/view_05662.view.lkml"
include: "/views/domain_13/view_05663.view.lkml"

explore: explore_1886 {
  label: "Explore Explore 1886"
  description: "Comprehensive analytics explore joining base view_05659 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05659
  
  always_filter: {
    filters: [view_05659.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05659.created_at_date: "7 days"]
    unless: [view_05659.id, view_05659.status]
  }

  join: view_05661 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05659.user_id} = ${view_05661.id} ;;
    required_joins: []
  }

  join: view_05662 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05659.account_id} = ${view_05662.account_id} ;;
    required_joins: [view_05661]
  }

  join: view_05663 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05659.category} = ${view_05663.category} ;;
  }

  access_filter: {
    field: view_05659.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05659.is_deleted} = false ;;
}
